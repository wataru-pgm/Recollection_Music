class ProfilesController < ApplicationController
  before_action :set_user

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
