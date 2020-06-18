# frozen_string_literal: true

module RuboCop
  module Cop
    module Layout
      # Checks that operators have space around them, except for ** which
      # should or shouldn't have surrounding space depending on configuration.
      #
      # This cop has `AllowForAlignment` option. When `true`, allows most
      # uses of extra spacing if the intent is to align with an operator on
      # the previous or next line, not counting empty lines or comment lines.
      #
      # @example
      #   # bad
      #   total = 3*4
      #   "apple"+"juice"
      #   my_number = 38/4
      #
      #   # good
      #   total = 3 * 4
      #   "apple" + "juice"
      #   my_number = 38 / 4
      #
      # @example AllowForAlignment: true (default)
      #   # good
      #   {
      #     1 =>  2,
      #     11 => 3
      #   }
      #
      # @example AllowForAlignment: false
      #   # bad
      #   {
      #     1 =>  2,
      #     11 => 3
      #   }
      #
      # @example EnforcedStyleForExponentOperator: no_space (default)
      #   # bad
      #   a ** b
      #
      #   # good
      #   a**b
      #
      # @example EnforcedStyleForExponentOperator: space
      #   # bad
      #   a**b
      #
      #   # good
      #   a ** b
      class SpaceAroundOperators < Cop
        include PrecedingFollowingAlignment
        include RangeHelp
        include RationalLiteral

        IRREGULAR_METHODS = %i[[] ! []=].freeze
        EXCESSIVE_SPACE = '  '

        def self.autocorrect_incompatible_with
          [Style::SelfAssignment]
        end

        def on_pair(node)
          return unless node.hash_rocket?

          return if hash_table_style? && !node.parent.pairs_on_same_line?

          check_operator(:pair, node.loc.operator, node.source_range)
        end

        def on_if(node)
          return unless node.ternary?

          check_operator(:if, node.loc.question, node.if_branch.source_range)
          check_operator(:if, node.loc.colon, node.else_branch.source_range)
        end

        def on_resbody(node)
          return unless node.loc.assoc

          _, variable, = *node

          check_operator(:resbody, node.loc.assoc, variable.source_range)
        end

        def on_send(node)
          return if rational_literal?(node)

          if node.setter_method?
            on_special_asgn(node)
          elsif regular_operator?(node)
            check_operator(:send,
                           node.loc.selector,
                           node.first_argument.source_range)
          end
        end

        def on_assignment(node)
          _, rhs, = *node

          return unless rhs

          check_operator(:assignment, node.loc.operator, rhs.source_range)
        end

        def on_binary(node)
          _, rhs, = *node

          return unless rhs

          check_operator(:binary, node.loc.operator, rhs.source_range)
        end

        def on_special_asgn(node)
          _, _, right, = *node

          return unless right

          check_operator(:special_asgn, node.loc.operator, right.source_range)
        end

        alias on_or       on_binary
        alias on_and      on_binary
        alias on_lvasgn   on_assignment
        alias on_masgn    on_assignment
        alias on_casgn    on_special_asgn
        alias on_ivasgn   on_assignment
        alias on_cvasgn   on_assignment
        alias on_gvasgn   on_assignment
        alias on_class    on_binary
        alias on_or_asgn  on_assignment
        alias on_and_asgn on_assignment
        alias on_op_asgn  on_special_asgn

        def autocorrect(range)
          lambda do |corrector|
            if range.source =~ /\*\*/ && !space_around_exponent_operator?
              corrector.replace(range, '**')
            elsif range.source.end_with?("\n")
              corrector.replace(range, " #{range.source.strip}\n")
            else
              enclose_operator_with_space(corrector, range)
            end
          end
        end

        private

        def regular_operator?(send_node)
          !send_node.unary_operation? && !send_node.dot? &&
            operator_with_regular_syntax?(send_node)
        end

        def operator_with_regular_syntax?(send_node)
          send_node.operator_method? &&
            !IRREGULAR_METHODS.include?(send_node.method_name)
        end

        def check_operator(type, operator, right_operand)
          with_space = range_with_surrounding_space(range: operator)
          return if with_space.source.start_with?("\n")

          offense(type, operator, with_space, right_operand) do |msg|
            add_offense(with_space, location: operator, message: msg)
          end
        end

        def offense(type, operator, with_space, right_operand)
          msg = offense_message(type, operator, with_space, right_operand)
          yield msg if msg
        end

        def enclose_operator_with_space(corrector, range)
          operator = range.source

          # If `ForceEqualSignAlignment` is true, `Layout/ExtraSpacing` cop
          # inserts spaces before operator. If `Layout/SpaceAroundOperators` cop
          # inserts a space, it collides and raises the infinite loop error.
          if force_equal_sign_alignment?
            corrector.insert_after(range, ' ') unless operator.end_with?(' ')
          else
            corrector.replace(range, " #{operator.strip} ")
          end
        end

        def offense_message(type, operator, with_space, right_operand)
          if should_not_have_surrounding_space?(operator)
            return if with_space.is?(operator.source)

            "Space around operator `#{operator.source}` detected."
          elsif !/^\s.*\s$/.match?(with_space.source)
            "Surrounding space missing for operator `#{operator.source}`."
          elsif excess_leading_space?(type, operator, with_space) ||
                excess_trailing_space?(right_operand, with_space)
            "Operator `#{operator.source}` should be surrounded " \
            'by a single space.'
          end
        end

        def excess_leading_space?(type, operator, with_space)
          return false unless allow_for_alignment?
          return false unless with_space.source.start_with?(EXCESSIVE_SPACE)

          return !aligned_with_operator?(operator) unless type == :assignment

          token            = Token.new(operator, nil, operator.source)
          align_preceding  = aligned_with_preceding_assignment(token)

          return align_preceding == :no unless align_preceding == :none

          aligned_with_subsequent_assignment(token) != :yes
        end

        def excess_trailing_space?(right_operand, with_space)
          with_space.source.end_with?(EXCESSIVE_SPACE) &&
            (!allow_for_alignment? || !aligned_with_something?(right_operand))
        end

        def align_hash_cop_config
          config.for_cop('Layout/HashAlignment')
        end

        def hash_table_style?
          align_hash_cop_config &&
            align_hash_cop_config['EnforcedHashRocketStyle'] == 'table'
        end

        def space_around_exponent_operator?
          cop_config['EnforcedStyleForExponentOperator'] == 'space'
        end

        def force_equal_sign_alignment?
          config.for_cop('Layout/ExtraSpacing')['ForceEqualSignAlignment']
        end

        def should_not_have_surrounding_space?(operator)
          operator.is?('**') ? !space_around_exponent_operator? : false
        end
      end
    end
  end
end
