class Post < ApplicationRecord

  validates_presence_of :date, :rationale, :overtime_request
  validates :overtime_request, numericality: { greater_than: 0.0 }

  belongs_to :user

  # Метод которые позволяет изменять статус поста просто приписав ему название статуса
  # post.approved! - меняет статус
  # post.rejected? проверяет статус
  enum status: { submitted: 0, approved: 1, rejected: 2 }

  # Для экшена Index формируем запрос , чтобы убрать логику из контроллера
  scope :posts_by, -> (user) { where(user_id: user.id) }

  after_save :update_audit_log

  private

  def update_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    audit_log.confirmed! if audit_log
end
end
