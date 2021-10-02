class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.page(params[:page])
  end

  def new
    @playlist = Playlist.new
    @playlist.movie_playlist_relations.build
  end

  # def edit
  # end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title, :youtube_url, :playlist_name, playlist_ids: [])
    end
end