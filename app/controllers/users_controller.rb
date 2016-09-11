class UsersController < ApplicationController
  # use fail to dump params hash to the browser

  def show
    respond_to do |format|
      format.html { @user = User.find(params[:id]) }
    end
  end

  def new
  end
end
