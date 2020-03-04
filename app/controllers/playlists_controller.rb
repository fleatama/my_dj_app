class PlaylistsController < ApplicationController
  def index
  end

  def create
    @playlist = Playlist.new(playlist_params)
    url = params[:playlist][:youtube_url]
    url = url.last(11)
    @playlist.youtube_url = url

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlst was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end
end
