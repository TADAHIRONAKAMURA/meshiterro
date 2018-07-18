class ApplicationController < ActionController::Base
 #すべてのページで認証が必要にする為のコード
  before_action :authenticate_user!
 #deviseを利用する機能（ユーザ登録、ログイン認証など）の場合、configure_permitted_parametersを実行します。
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
