# frozen_string_literal: true

module Solargraph
  module Pin
    module YardPin
      class Method < Pin::Method
        include YardMixin

        def initialize code_object, name = nil, scope = nil, visibility = nil, closure = nil, spec = nil
          closure ||= Solargraph::Pin::Namespace.new(
            name: code_object.namespace.to_s,
            gates: [code_object.namespace.to_s]
          )
          super(
            location: object_location(code_object, spec),
            closure: closure,
            name: name || code_object.name.to_s,
            comments: code_object.docstring ? code_object.docstring.all.to_s : '',
            scope: scope || code_object.scope,
            visibility: visibility || code_object.visibility,
            parameters: get_parameters(code_object),
            explicit: code_object.is_explicit?
          )
        end

        private

        def get_parameters code_object
          return [] unless code_object.is_a?(YARD::CodeObjects::MethodObject)
          code_object.parameters.map do |a|
            Solargraph::Pin::Parameter.new(
              location: location,
              closure: self,
              comments: comments,
              name: arg_name(a),
              presence: nil,
              decl: arg_type(a),
              asgn_code: a[1]
            )
          end
        end

        def arg_name a
          a[0].match(/[A-Za-z0-9_]*/)[0]
        end

        def arg_type a
          if a[0].start_with?('**')
            :kwrestarg
          elsif a[0].start_with?('*')
            :restarg
          elsif a[0].start_with?('&')
            :blockarg
          elsif a[1]
            :optarg
          elsif a[0].end_with?(':')
            a[1] ? :kwarg : :kwoptarg
          else
            :arg
          end
        end
      end
    end
  end
end
