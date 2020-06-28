require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    @user = FactoryBot.create(:user, name: "ユーザーA", email: "email@example.com", password: "email@example.com")
  end

  describe "アカウント作成" do
    it 'アカウントが作成され、同時にログインされること' do
      visit new_user_registration_path
      fill_in '名前', with: 'true'
      fill_in 'メールアドレス', with: 'testtt@sample.com'
      fill_in '新しいパスワード', with: 'password'
      click_on 'アカウント登録'
      expect(page).to have_content 'アカウント登録が完了しました。'
    end
  end

  describe "ログイン" do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'email@example.com'
      fill_in 'パスワード', with: 'email@example.com'
      click_button 'ログイン'
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
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました'
    end

    it 'ユーザー編集できるか' do
      visit edit_user_registration_path
      fill_in '名前', with: 'TARO'
      click_on '保存'
      expect(page).to have_content 'アカウント情報を変更しました'
    end

    it 'ユーザー退会できるか' do
      visit edit_user_registration_path
      click_on 'ユーザー削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'ログイン'
    end
  end
end