# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include ApplicationHelper

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:phone_number, :email, :password, :nickname) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:phone_number, :email, :password, :nickname) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:phone_number, :password, :current_password)
    end
  end
end
