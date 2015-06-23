class UserController < ApplicationController
  def signup
  end

  def login
  end

  def create
  	@user = User.new(user_params(params[:user]))
  	if @user.save then
  		redirect_to(:action => :login)
  	else
  		render(:action => :signup)
  	end
  end

  private
  def user_params(params)
  	return params.permit(:username, :password, :email)
  end
end
