
module Admin

  def self.admin_types
    ['AdminUser']
  end

  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin
    before_action :authenticate_user!



    def authenticate_admin
      unless Admin.admin_types.include?(current_user.try(:type)) # Проверяем входит ли текущий пользователь в одну из групп Админов
        flash[:alert] = " You are not authorize to access this page"
        redirect_to root_path
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
