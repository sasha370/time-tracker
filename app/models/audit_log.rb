class AuditLog < ApplicationRecord

  # AuditLog -  это список все переработок за последнюю неделю, неделя наяинается в ВС
  # Таким образом у Пользователя будет 4-5 недельных выписок
  belongs_to :user

  validates_presence_of :status, :start_date, :user_id
  after_initialize :set_defaults

  enum status: {pending: 0, confirmed: 1}

  before_update :set_end_date, if: :confirmed?

  scope :by_start_date, -> { order(start_date: :desc) }

  private

  def set_defaults
    self.start_date ||= (Date.today - 6.days)
  end

  def set_end_date
    self.end_date = Date.today
  end
end
