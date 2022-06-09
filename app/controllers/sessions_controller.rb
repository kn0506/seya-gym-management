class SessionsController < ApplicationController
  def create
    name = params[:session][:email]
    phone_number = params[:session][:phone]
    if login(name, phone_number)
      flash[:success] = 'ログインに成功しました'
      redirect_to @user
    else
      flash[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
  end

  private

  def login(name, phone_number)
    @user = User.find_by(name: name)
    if @user && @user.authenticate()
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end