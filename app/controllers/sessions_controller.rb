class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      redirect_to user
    else
      flash.now[:danger] = 'ログイン情報が間違えています。'
      render 'new'
    end
  end
end