class Post < ApplicationRecord

  validates :date, presence:  true
  validates :rationale, presence:  true
  belongs_to :user

  # Метод которые позволяет изменять статус поста просто приписав ему название статуса
  # post.approved! - меняет статус
  # post.rejected? проверяет статус
  enum status: {submitted: 0, approved: 1, rejected: 2}

  # Для экшена Index формируем запрос , чтобы убрать логику из контроллера
  scope :posts_by, -> (user) {where(user_id: user.id)}

end
