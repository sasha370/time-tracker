class StaticController < ApplicationController

  def homepage
    @pending_approvals = Post.where(status: 'submitted')
    @confirmation_log = AuditLog.last(10)
  end


end