namespace :notification do

  desc "Sends sms notification to user asking them to log if they had overtime or not"
    task sms: :environment do
      employees = Employee.all
      message = "Please log into "
      employees.each do
         SmsTool.send_sms( message: message)
       end

    end

  desc "Sends Email notification to AdminUsers each day to inform of pending Overtime requests"
    task manager_email: :environment do
      # 1. Выбрать все Посты со стутусом submitted
      # 2. Проверить,  что есть записи
      # 3.  Dыбрать всех админов
      # 4. cltkfnm рассылку по всем Админам
      admin_users = AdminUser.all
      if Post.submitted.any?
        admin_users.each do |admin|
          ManagerMailer.email(admin).deliver_later
          puts "Ok"
        end
      end
    end

end
