class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:avatar, :name, :email, :password) }
  		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:avatar, :name, :password,:password_confirmation, :current_password, :birth, :introduce) }
  	end
end
