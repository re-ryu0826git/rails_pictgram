module ApplicationHelper
    # application_helperなどのhelperはviewで使用する共通のコードを指定
    # def current_user
    #     @current_user ||= User.find_by(id: session[:user_id])
    # end
    
    # def logged_in?
    #     !current_user.nil?
    # end
    
    # application_controller.rbとapplication_helper.rb内の記述から重複したコードを削除し変更
    include CommonActions
end
