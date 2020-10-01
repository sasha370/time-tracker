
FactoryBot.define do
  # Генератор постов
  # У каждого поста гененрируется пользователь со случайным email

  factory :post, class: "Post" do
    date { Date.today }
    rationale { "Post1" }
    user
  end

  factory :second_post, class: "Post" do
    date { Date.yesterday }
    rationale { "Post2" }
    user
  end
end