class UsersController < ApplicationController
  def signup
  	@user = User.new
  end

  def login
  	@user = User.new
  end

  def post_login
  	@user = User.find_by username: params[:user][:username]
  	if @user then
	  	if @user.authenticate(params[:user][:password]) then
	  		session[:user_id] = @user.id
	  		redirect_to(:action => :login)
	  	else
	  		@user.errors.add(:password, "Invalid password")
	  		render 'login'
	  	end
	  else
	  	@user = User.new
	  	@user.errors.add(:username, "not found")
	  	render 'login'
	  end
  end
 
  def create
  	@user = User.new(user_params(params[:user]))
  	if @user.save then
  		session[:user_id] = @user.id
  		redirect_to(:action => :login)
  	else
  		render(:action => :signup)
  	end
  end

  private
  def user_params(params)
  	return params.permit(:username, :password, :password_confirmation, :email)
  end
end
