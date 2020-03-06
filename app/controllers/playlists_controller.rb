class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = Playlist.all.page(params[:page])
  end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def edit
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

  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok,
        location: @playlist }
      else
        format.html { render :edt }
        format.json { render json: @playlist.errors, status:
        :unprocessable_entity }
      end
    end
  end

  def destroy
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
      params.require(:playlist).permit(:content, :youtube_url)
    end
end