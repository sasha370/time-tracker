require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @user = User.create(email: 'test@test.ru', password: '123456', password_confirmation: '123456', first_name: 'John', last_name: 'Connor')
      @post = Post.create(date: Date.today, rationale: "Anythibg", user: @user)
    end

    it "can be created" do
      expect(@post).to be_valid
    end


    it " cannot be created without a date and rational" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end


  end
end
