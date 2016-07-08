class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for :sign_up do |user|
      user.permit :name, :email, :password, :password_confirmation,
        :remember_me, :avatar
    end
    devise_parameter_sanitizer.for :account_update do |user|
      user.permit :name, :email, :password, :password_confirmation,
        :current_password, :avatar
    end
  end
end
