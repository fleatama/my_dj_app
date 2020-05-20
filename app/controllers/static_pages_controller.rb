class StaticPagesController < ApplicationController
  def home
    @movie = current_user.movies.build if user_signed_in?
    @playlist = Playlist.new
  end

  def help
  end

  def about
  end

  def contact
  end

  private

    def static_pages
      params.require(:static_pages).permit(:playlist_name, playlist_ids: [])
    end
end
