class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      flash[:notice] = "You have been registered."
      redirect_to root_path
    else 
      render :new
    end
  end

  def edit  
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end