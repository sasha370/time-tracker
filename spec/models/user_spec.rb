require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      # блок будет выполнен перед каждым тестом в этом разделе
      @user = User.create(email: 'test@test.ru', password: '123456', password_confirmation: '123456', first_name: 'John', last_name: 'Connor')
    end
  describe 'creation' do


      # User может быть создан
    it "can be created" do
      expect(@user).to be_valid
    end

    # User не может быть создан без этих полей
    it 'cannot be created without first_name and last_name' do
      # удаляем заданные строки
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq("Connor, John")
    end
  end
end
