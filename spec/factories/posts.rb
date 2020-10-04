FactoryBot.define do
  # Генератор постов
  # У каждого поста гененрируется пользователь со случайным email

  factory :post, class: "Post" do
    date { Date.today }
    rationale { "Post1" }
    user
    overtime_request { 3.5 }
  end

  factory :second_post, class: "Post" do
    date { Date.yesterday }
    rationale { "Post2" }
    user
   overtime_request { 3.5 }
  end


end