class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  #application_controllerはcontrollerで共通で使用するコードを指定
  # 現在ログインしているuserを返すメソッド
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

  # ログインしているか確認するメソッド
  # def logged_in?
  #   !current_user.nil?
  # end
  
  # application_controller.rbとapplication_helper.rb内の記述から重複したコードを削除し変更
  include CommonActions
  
end
