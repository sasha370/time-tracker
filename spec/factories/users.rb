
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
    phone { "5555555555" }
    ssn { '1234'}
    company { 'ABC Ltd'}
  end

  factory :employee, class: "Employee" do
    first_name { 'John' }
    last_name { 'Employee' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
    phone { "5555555555" }
    ssn { '1234'}
    company { 'ABC Ltd'}
  end

  # Второй пользователь
  factory :second_user, class: "User" do
    first_name { 'John' }
    last_name { 'Snow' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
    phone { "5555555555" }
    ssn { '1234'}
    company { 'ABC Ltd'}
  end

  # Админ
  factory :admin_user, class: "AdminUser" do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
    phone { "5555555555" }
    ssn { '1234'}
    company { 'ABC Ltd'}
  end

  # Второй пользователь дял проверки авторизации к чужим записям
  factory :non_authorize_user, class: "User" do
    first_name { 'Non' }
    last_name { 'Authorize' }
    email { generate :email }
    password { '123456' }
    password_confirmation { '123456' }
    phone { "5555555555" }
    ssn { '1234'}
    company { 'ABC Ltd'}
  end


end