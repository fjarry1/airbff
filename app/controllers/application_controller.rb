class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :birthdate, :description, :gender, :city) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :birthdate, :description, :gender, :city) }
  end
end
