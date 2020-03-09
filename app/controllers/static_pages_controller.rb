class StaticPagesController < ApplicationController
  def home
    @movie = current_user.movies.build if user_signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
