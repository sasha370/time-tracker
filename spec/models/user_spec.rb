require 'rails_helper'


# Проверяем Модель User
RSpec.describe User, type: :model do

  before do
    # блок будет выполнен перед каждым тестом в этом разделе
    @user = FactoryBot.create(:user)
  end

  describe 'creation' do
    # User может быть создан
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe 'validations' do
    # User не может быть создан без этих полей
    it 'cannot be created without first_name ' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'cannot be created without last_name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'cannot be created without phone' do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it 'requires the phone attr to only contain integers' do
      @user.phone = 'mygreatstring'
      expect(@user).to_not be_valid

    end

    it 'require the phone attr to only have 1-14 chars' do
      @user.phone = '1234567899800025'
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    # Проверяем метод, который создает полное имя

    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq("Connor, John")
    end
  end
end
