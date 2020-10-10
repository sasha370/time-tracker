class StaticController < ApplicationController

  def homepage
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @confirmation_log = AuditLog.last(10)
    else
      # TODO
      @pending_audit_confirmations = current_user.audit_logs.pending
    end
  end

end