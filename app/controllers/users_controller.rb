class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      #Handle a successful save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #omit user_path because this redirects to user show page
    else
      render 'new'
    end
  end
end

