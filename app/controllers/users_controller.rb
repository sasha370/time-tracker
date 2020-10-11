class UsersController < ApplicationController

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do
    |u| u.permit( :email, :password, :first_name, :last_name, :password_confirmation, :admin, :type, :phone, :ssn, :company)
    end

    devise_parameter_sanitizer.permit(:account_update) do
    |u| u.permit(:email, :first_name, :password, :last_name, :password_confirmation, :admin, :type, :phone, :current_password, :ssn, :company)
    end
  end

end