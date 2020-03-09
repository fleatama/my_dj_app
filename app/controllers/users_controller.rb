class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page])
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @movies = @user.movies.page(params[:page])
  end
end
