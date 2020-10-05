class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all
    authorize @audit_logs # сначала опредлеить переменную и тольео потом ее проверять
  end
end
