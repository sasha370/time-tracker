require 'rails_helper'

describe ' Auditlog Fiature' do
  let(:audit_log) {FactoryBot.create(:audit_log)}

  describe 'index' do
    before do
      @admin_user = FactoryBot.create(:admin_user)
      login_as(@admin_user, scope: :user)
    end

    it ' has an index page' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit logs content' do
      visit audit_logs_path
      expect(page).to have_content(/Audit Logs/)
    end

    it 'can not be access by non admin user' do
      logout(@admin_user)
      @user = FactoryBot.create(:user)
      login_as(@user, scope: :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end

  end

end