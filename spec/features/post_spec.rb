require 'rails_helper'

# Тестирование всех функция связанных с Постами
describe 'navigate' do
  # Единожды генерируем пользователя и привязанный к нему пост
  let(:user) { FactoryBot.create(:user) }
  let(:post) do
    Post.create(date: Date.today, work_perform: "Work perform", user_id: user.id, daily_hours: 3.5)
  end

  before do
    login_as(user, scope: :user)
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
      post1 = FactoryBot.create(:post, user_id: user.id)
      post2 = FactoryBot.create(:second_post, user_id: user.id)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end

    it 'has a scope so that only post creators can see their posts' do
      other_user = FactoryBot.create(:non_authorize_user)
      post_from_other_user = Post.create(date: Date.today, work_perform: "Post should not be seen", user_id: other_user.id, daily_hours: 3.5)
      visit posts_path

      expect(page).to_not have_content('Post should not be seen')
    end
  end

  describe 'new' do
    # Можно создать новый Пост
    it 'has a link from thу homepage' do
      employee = FactoryBot.create(:employee)
      login_as(employee, scope: :user)
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be delete' do
      logout(:user)
      delete_user = FactoryBot.create(:user)
      login_as(delete_user, scope: :user)
      delete_post = FactoryBot.create(:post, user_id: delete_user.id, daily_hours: 3.5)
      visit posts_path
      click_link("delete_#{delete_post.id}")
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
      fill_in 'post[date]', with: Date.today
      fill_in 'post[work_perform]', with: "Some perform"
      fill_in 'post[daily_hours]', with: 4.5
      expect { click_on "Save"}.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[work_perform]', with: "User association"
      fill_in 'post[daily_hours]', with: 4.5

      click_on "Save"
      expect(User.last.posts.last.work_perform).to eq("User association")
    end
  end

  describe 'edit' do

    it 'can be editing' do
      visit edit_post_path(post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[work_perform]', with: "Editing content"
      click_on 'Save'
      expect(page).to have_content("Editing content")
    end

    it 'can not be edited by non Admin user' do
      logout(:user)
      non_authorize_user = FactoryBot.create(:non_authorize_user)
      login_as(non_authorize_user, scope: :user)
      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end

end