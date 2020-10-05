require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit_log = FactoryBot.create(:audit_log)
  end

  describe 'creation' do

    it 'can be created' do
      expect(@audit_log).to be_valid
    end

    describe 'validations' do
      it 'it should be requered to have user association' do
        @audit_log.user_id = nil
        expect(@audit_log).to_not be_valid
      end

      it ' should have a status' do
        @audit_log.status = nil
        expect(@audit_log).to_not be_valid
      end

      it 'should have start_date' do
        @audit_log.start_date = nil
        expect(@audit_log).to_not be_valid
      end

      it 'start_date should be minus 6 days' do
        new_audit_log = AuditLog.create(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
        expect(new_audit_log.start_date).to eq(Date.today - 6.days)
      end


    end

  end

end
