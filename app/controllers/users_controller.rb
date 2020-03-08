class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    # @playlists = @user.playlists.page(params[:page])
  end
end
