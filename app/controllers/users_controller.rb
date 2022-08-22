class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_index_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user])
  end

  def destroy
    @user.destroy
    redirect_to user_index_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthdate, :description, :gender, :city)
  end
end
