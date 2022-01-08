class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to boards_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @boards = @user.boards
  end

  def following
    @followings = @user.followings
  end

  def follower
    @follower = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
