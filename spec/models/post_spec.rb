require 'rails_helper'

# Проверка Моделей

RSpec.describe Post, type: :model do

  describe "Creation" do
    # Создаем тестовый Пост

    before do
      @post = FactoryBot.create(:post)
    end

    it "can be created" do
      #ghjdthztv что пост создался\ валидный
      expect(@post).to be_valid
    end


    it " cannot be created without a date and rational" do
      # проверяем что нельзя создать пост с пустыми полями
      @post.date = nil
      @post.rationale = nil
      @post.overtime_request = nil
      expect(@post).to_not be_valid
    end

    it ' has overtime_request greater than 0.0' do
      @post.overtime_request = 0.0
      expect(@post).to_not be_valid

    end
  end
end
