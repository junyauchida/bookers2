class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
# ログイン後にこの画面に飛ぶ

  def after_sign_up_path_for(resource)
    user_path(resource)
  end
 # サインアップ(新規登録)後にこの画面に飛ぶ

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email]) #追記した サインアップではname、emailが必要
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) #追記した　サインインではnameだけが必要
   devise_parameter_sanitizer.permit(:account_update, keys: [:name,:email]) #追記した
  end
end