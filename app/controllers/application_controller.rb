class ApplicationController < ActionController::Base
  before_action :authenticate_user!#ログイン必須に
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:group,:mode])
  end
  

end
