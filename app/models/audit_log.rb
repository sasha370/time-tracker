class AuditLog < ApplicationRecord
  belongs_to :user

  validates_presence_of :status, :start_date, :user_id
  after_initialize :set_defaults

  private
  # В том случае, если не проставилась дата отсчета, выбираем самостоятельно
  def set_defaults
    self.start_date ||= (Date.today - 6.days)
  end
end
