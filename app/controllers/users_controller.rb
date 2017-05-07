class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    if @user.save
      flash[:notice] = "Welcome to Blocipedia #{@user.name}"
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
