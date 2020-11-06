class ApplicationController < ActionController::Base
  before_action :authenticate_user!#ログイン必須に
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:group,:mode])
  end
  
  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["wms_3_user"] && password == ENV["wms_3_pass"]
    end
  end

end
