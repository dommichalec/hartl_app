class UsersController < ApplicationController
  # use fail to dump params hash to the browser

  # GET
  def show
    respond_to do |format|
      format.html { @user = User.find(params[:id]) }
    end
  end

  # GET
  def new
    @user = User.new
  end

  # POST
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  # GET
  def show
    @user = User.find(params[:id])
  end

  private

  # used to enable mass assignment
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation)
  end
end
