class PlaylistsController < ApplicationController

  def new
    @playlist = Playlist.new
  end

  def edit
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  private
    # def playlist_params
    #   params.require(:playlist).permit(:title, :youtube_url, :playlist_name, playlist_ids: [])
    # end
    def playlist_params
      params.require(:playlist).permit(:playlist_name, playlist_ids: [])
    end
end