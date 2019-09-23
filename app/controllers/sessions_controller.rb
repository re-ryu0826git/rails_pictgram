class SessionsController < ApplicationController
  def new
  end

  def create
    # フォームから送信されたメールアドレスを取得し、一致するユーザがいるか検索
    user = User.find_by(email: params[:session][:email])
    
    # ユーザ名とパスワードが一致しているのか確かめる
    if user && user.authenticate(params[:session][:password])
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
  
end
