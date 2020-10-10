class AuditLogPolicy < ApplicationPolicy

  def index?
    admin?
  end

  def confirmed?
    record.user_id == user.id
  end

  private

  def admin?
    admin_types.include?(user.type)
  end


end