class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized




  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do
    |u| u.permit( :email, :password, :first_name, :last_name, :password_confirmation, :admin, :type)
    end

    devise_parameter_sanitizer.permit(:account_update) do
    |u| u.permit(:email, :first_name, :password, :last_name, :password_confirmation, :admin, :type)
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to( root_path)
  end


end
