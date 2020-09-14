class ApplicationController < ActionController::Base
  # ↓ログインしないとAppを利用できないようにする
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # userテーブルにカラムを追加したらここでデータ保存の許可をする↓
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:group,:mode])
  end
  

end
