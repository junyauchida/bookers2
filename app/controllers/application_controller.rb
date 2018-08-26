class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  # ログインしていない場合、ログイン画面に飛ばす　していたら画面
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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
