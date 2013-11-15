class UsersController < ApplicationController

  before_action :require_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your account has been created. Welcome aboard!"
      redirect_to login_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:username,:password)
  end

end