require 'rails_helper'

# Первый тест.
describe 'navigate' do
  describe 'homepage' do
    it 'can be reached successfully' do
      # посетить домашнюю страницу, должны получить ответ 200 OK
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end