class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all.page(params[:page]).per(10)
    authorize @audit_logs # сначала опредлеить переменную и тольео потом ее проверять
  end

  def confirmed
    @audit_log = AuditLog.find(params[:id])
    authorize @audit_log
    @audit_log.confirmed!
    redirect_to root_path, notice: "Thank you! Your confirmation was succesfully made!"
  end
end
