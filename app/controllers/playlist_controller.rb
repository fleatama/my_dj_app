class PlaylistController < ApplicationController
  def create
    @playlist = Playlist.new(playlist_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
  end
end
