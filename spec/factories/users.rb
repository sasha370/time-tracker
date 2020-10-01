
# Фабрика по производству Пользователей
FactoryBot.define do

  # генератор случайных email ов
  sequence :email do |n|
    "test#{n}@test.ru"
  end

  # Первый пользователь
  factory :user, class: "User" do
    first_name { 'John' }
    last_name { 'Connor' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  # Второй пользователь
  factory :second_user, class: "User" do
    first_name { 'John' }
    last_name { 'Snow' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  # Админ
  factory :admin_user, class: "AdminUser" do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
  end
end