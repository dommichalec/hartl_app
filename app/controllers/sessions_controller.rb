class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:success] = "Boom! Welcome back, #{user.first_name}."
      redirect_to user_path(user)
    else
      # render is not a new request like redirect_to, therefor we use flash.now
      # so the flash only shows up once.
      flash.now[:danger] =
      "Doh! Looks like that email/password combo is incorrect"
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = "You've signed out! See you again soon."
    redirect_to root_path
  end
end
