class SessionsController < ApplicationController
  def new
  end

  def create
    # フォームから送信されたメールアドレスを取得し、一致するユーザがいるか検索
    user = User.find_by(session_params)
    
    # ユーザ名とパスワードが一致しているのか確かめる
    # パスワードの値を渡す :passwordキーを指定する必要がある
    if user && user.authenticate(password_params[:password])
      login_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  # ログアウト機能
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  # login_inメソッドでsession[:user_id]にログイン情報を保存
  def login_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    # セッションを削除
    session.delete(:user_id)
    # ユーザ情報を削除
    @current_user = nil
  end
  
  # ストロングパラメーター
  private
  def session_params
    params.require(:session).permit(:email)
  end
  
  private
  def password_params
    params.require(:session).permit(:password)
  end
end
