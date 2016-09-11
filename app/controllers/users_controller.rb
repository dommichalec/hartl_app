class UsersController < ApplicationController
  # use fail to dump params hash to the browser

  def show
    @user = User.find(params[:id])
  end

  def new
  end
end
