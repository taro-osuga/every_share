require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    @user = FactoryBot.create(:user, name: "ユーザーA", email: "email@example.com", password: "email@example.com")
  end

  describe "アカウント作成" do
    it 'アカウントが作成され、同時にログインされること' do
      visit new_user_registration_path
      fill_in 'Name', with: 'true'
      fill_in 'Email', with: 'testtt@sample.com'
      fill_in 'Password', with: 'password'
      click_on 'Sign up'
      expect(page).to have_content 'アカウント登録が完了しました。'
    end
  end

  describe "ログイン" do
    before do
      visit new_user_session_path
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'email@example.com'
      click_on 'Log in'
    end

    it '正しくログインされること' do
      expect(page).to have_content 'ログインしました'
    end

    it 'ログインページが正しく表示されていること' do
      expect(page).to have_content 'ユーザーA'
    end

    it '正しくログアウトできること' do
      sleep(5)
      click_on 'ユーザーA'
      click_on 'Log out'
      expect(page).to have_content 'ログアウトしました'
    end
  end
end