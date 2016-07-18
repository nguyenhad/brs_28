class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_url, alert: exception.message
  end
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys:
      [:name, :email, :password, :password_confirmation, :remember_me, :avatar]
    devise_parameter_sanitizer.permit :account_update,
      keys: [:name, :email, :password, :password_confirmation,
      :current_password, :avatar]
  end
end
