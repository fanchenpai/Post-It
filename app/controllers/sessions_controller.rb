class SessionsController < ApplicationController

	def new
    @user = User.new
    render 'users/login'
	end

	def create
    user = User.where('lower(username) = ?', params[:user][:username].downcase).first
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:error] = "There's something wrong with your username/password."
      redirect_to login_path
    end

	end

	def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out successfully. Bye!"
    redirect_to posts_path
	end

end