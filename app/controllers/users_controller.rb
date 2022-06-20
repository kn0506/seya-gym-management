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

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ログイン成功です！'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
    if @user.update
      flash[:success] = '変更しました'
      redirect_to @user
    else
      render '@user'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy!
    flash[:success] = '正常に削除されました'
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :phone_number, :password, :password_confirmation)
    end
end
