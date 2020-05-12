class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  def index
    @movies = Movie.all.page(params[:page])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @movie.movie_playlist_relations.build
  end

  def edit
  end

  def create
    @movie = current_user.movies.build(movie_params)
    url = params[:movie][:youtube_url]
    url = url.last(11)
    @movie.youtube_url = url

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok,
        location: @movie }
      else
        format.html { render :edt }
        format.json { render json: @movie.errors, status:
        :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :youtube_url, :playlist, playlist_ids:[])
    end
end
