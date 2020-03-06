class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists.page(params[:page])
  end
end
