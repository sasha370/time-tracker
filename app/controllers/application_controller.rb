class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!
  protect_from_forgery with: :exception


  # Задаем группу Админов, которую будем использовать при проверке статуса User
  # TODO
  def admin_types
    ['AdminUser']
  end
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to( root_path)
  end

end
