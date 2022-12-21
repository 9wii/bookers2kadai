class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  user_path(current_user.id)
  end

  # ログアウト後トップページに以降
  def after_sign_out_path_for(resource)
    root_path
  end
  
  
  protected

  def configure_permitted_parameters
    # configで認証キーをemail => nameに変更したので、
    # sign_up時に設定するユーザー名はemailからnameになった
    # ストロングパラメータで認証キーではないカラム(name)の操作許可をしていたので、emailに変更
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
