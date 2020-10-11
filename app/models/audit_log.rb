class AuditLog < ApplicationRecord

  # AuditLog -  это список все переработок за последнюю неделю, неделя наяинается в ВС
  # Таким образом у Пользователя будет 4-5 недельных выписок
  belongs_to :user

  validates_presence_of :status, :start_date, :user_id
  after_initialize :set_defaults

  # Метод которые позволяет изменять статус поста просто приписав ему название статуса
  # self.pending! - меняет статус
  # self.confirmed? проверяет статус
  enum status: {pending: 0, confirmed: 1}

  before_update :set_end_date, if: :confirmed?
  private
  # В том случае, если не проставилась дата отсчета, выбираем самостоятельно
  def set_defaults
    self.start_date ||= (Date.today - 6.days)
  end

  def set_end_date
    self.end_date = Date.today
  end
end
