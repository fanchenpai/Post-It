class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your account has been created. Welcome aboard!"
      redirect_to login_path
    else
      render 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:password)
  end

end