class StaticPagesController < ApplicationController
  def home
    @playlist = current_user.playlists.build if user_signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
