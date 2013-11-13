class SessionsController < ApplicationController

	def new
    @user = User.new
    render 'users/login'
	end

	def create
    binding.pry
    @user = User.find_by username: params[:user][:username]
    render 'users/login'
	end

	def destroy

	end

  private

  def user_params
    params.require(:user).permit(:username,:password)
  end

end