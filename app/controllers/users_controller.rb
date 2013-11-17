class UsersController < ApplicationController

  before_action :require_user, except: [:new, :create]

  def index

  end

  def show
    @user = User.find_by(slug: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your account has been created. Welcome aboard!"
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to profile_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:password)
  end

end