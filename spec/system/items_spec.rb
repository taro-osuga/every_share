require 'rails_helper'

RSpec.describe 'Item', type: :system do
  describe "ログインして、アイテム登録" do

    before do
      @user = FactoryBot.create(:user, name: "ユーザーA", email: "email@example.com", password: "email@example.com")
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'email@example.com'
      fill_in 'パスワード', with: 'email@example.com'
      click_button 'ログイン'
    end

    it 'アイテム新規登録' do
      
      visit new_item_path 
      select 'アウトドア', from: 'item_main_category'
      select '洋服', from: 'item_sub_category'
      select '綺麗', from: 'item_status'
      click_on '仮登録'
      expect(page).to have_content '詳細登録して下さい'
    end

    it 'アイテム詳細登録' do
      visit new_item_path
      select 'アウトドア', from: 'item_main_category'
      select '洋服', from: 'item_sub_category'
      select '綺麗', from: 'item_status'
      click_on '仮登録'
      fill_in "price", with: 100
      click_on '値段設定保存'
      click_on '詳細'
      fill_in 'アイテム名', with: '100'
      fill_in 'summary', with: '100'
      click_on 'アイテム説明保存'
      click_on '写真'
      attach_file 'images_', "#{Rails.root}/spec/factories/sample1.jpg", make_visible: true
      click_on '写真保存'
      click_on 'レンタルエリア'
      fill_in 'autoaddress', with: 'tokyo'
      click_on 'レンタルエリア保存'
      click_on '最終登録'
      expect(page).to have_content '詳細登録しました！'
    end

    it 'アイテム登録エラー' do
      
      visit new_item_path 
      select '洋服', from: 'item_sub_category'
      select '綺麗', from: 'item_status'
      click_on '仮登録'
      expect(page).to have_content '入力不足があります'
    end

    it 'アイテム詳細登録エラー' do
      visit new_item_path
      select 'アウトドア', from: 'item_main_category'
      select '洋服', from: 'item_sub_category'
      select '綺麗', from: 'item_status'
      click_on '仮登録'
      click_on '値段設定保存'
      expect {
        find("#price_check")
      }.to raise_error(Capybara::ElementNotFound)
    end

    it 'アイテム編集' do
      visit new_item_path
      select 'アウトドア', from: 'item_main_category'
      select '洋服', from: 'item_sub_category'
      select '綺麗', from: 'item_status'
      click_on '仮登録'
      fill_in "price", with: 100
      click_on '値段設定保存'
      click_on '詳細'
      fill_in 'アイテム名', with: '100'
      fill_in 'summary', with: '100'
      click_on 'アイテム説明保存'
      click_on '写真'
      attach_file 'images_', "#{Rails.root}/spec/factories/sample1.jpg", make_visible: true
      click_on '写真保存'
      click_on 'レンタルエリア'
      fill_in 'autoaddress', with: 'tokyo'
      click_on 'レンタルエリア保存'
      click_on '最終登録'
      visit items_path
      click_link '編集'
      select 'スポーツ', from: 'item_main_category'
      click_on '概要保存'
      expect(page).to have_content 'スポーツ'
    end

    it 'アイテム削除' do
      visit new_item_path
      select 'アウトドア', from: 'item_main_category'
      select '洋服', from: 'item_sub_category'
      select '綺麗', from: 'item_status'
      click_on '仮登録'
      fill_in "price", with: 100
      click_on '値段設定保存'
      click_on '詳細'
      fill_in 'アイテム名', with: '100'
      fill_in 'summary', with: '100'
      click_on 'アイテム説明保存'
      click_on '写真'
      attach_file 'images_', "#{Rails.root}/spec/factories/sample1.jpg", make_visible: true
      click_on '写真保存'
      click_on 'レンタルエリア'
      fill_in 'autoaddress', with: 'tokyo'
      click_on 'レンタルエリア保存'
      click_on '最終登録'
      visit items_path
      click_link '削除'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content '削除しました'
    end
  end
end