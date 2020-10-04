require 'rails_helper'

# Тестирование всех функция связанных с Постами
describe 'navigate' do

  # Перед любым тестом нам надо создать пользователя и зайти под ним
  before do
    # Пользователь генерируется в фабрике
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  describe "index" do
    # проверяем экшн Index и отображение на странице

    before do
      visit posts_path # перед любым тестом заходим на страницу Index
    end

    it 'can be reached successfully' do
      # При удачном заходе возвращается код 200
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      # Cnhfybwf должна содержать Текст Posts
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      # На странице должны быть два соpданных в фабрике поста]]
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'new' do
    # Можно создать новый Пост
    it 'has a link from thу homepage' do
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be delete' do
      @post = FactoryBot.create(:post)
      visit posts_path
      click_link("delete_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

  end

  describe 'creation' do
    # Проверяем создание Постов

    before do
      # перед каждым тестом нужно посетить страницу "Создать новый пост"
      visit new_post_path
    end

    it 'has a form that can be reached' do
      # при посещении страница должна возвращать код 200
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page ' do
      # Pfjgkyztv форму и отправляем. по результатам долджны увидеть содержимое поста
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      click_on 'Save'
      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated it' do
      # Проверяем, что пост подцепился к текущему пользователю
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User association")
    end
  end

  describe 'edit' do
    before do
      logout(:user)
      @edit_user = User.create(first_name: "Edit", last_name: 'I can', email: 'edit@edit.eu', password: '123456')
      @edit_post = FactoryBot.create(:post, user_id: @edit_user.id)
    end

    it 'can be editing' do
      login_as(@edit_user, scope: :user)
      visit edit_post_path(@edit_post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Editing content"
      click_on 'Save'
      expect(page).to have_content("Editing content")
    end

    it 'can not be edited by non Admin user' do
      non_authorize_user = FactoryBot.create(:non_authorize_user)
      login_as(non_authorize_user, scope: :user)
      visit edit_post_path(@edit_post)
      expect(current_path).to eq(root_path)
    end
  end


end