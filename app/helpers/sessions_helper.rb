module SessionsHelper
  def current_user
    # @current_userに既に現在のログインユーザが代入されていたら何もせず、
    # 代入されていなかったら User.find_by(...) からログインユーザを取得し、
    # @current_user に代入する処理を1行で書いたもの.
    @current_user ||= User.find_by(id: session[:user_id])
  
    # 渡されたユーザーでログインする
   def log_in(user)
    session[:user_id] = user.id
  end

  end
end
