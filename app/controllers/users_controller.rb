class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(50)
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit 
  end
end
