FactoryBot.define do
  # Генератор постов
  # У каждого поста гененрируется пользователь со случайным email

  factory :post, class: "Post" do
    date { Date.today }
    work_perform { "Post1" }
    user
    daily_hours { 3.5 }
  end

  factory :second_post, class: "Post" do
    date { Date.yesterday }
    work_perform { "Post2" }
    user
   daily_hours { 3.5 }
  end


end