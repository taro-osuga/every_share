require 'rails_helper'

RSpec.describe 'Item', type: :system do
  describe "ログインして、アイテム登録" do

    before do
      @user = FactoryBot.create(:user, name: "ユーザーA", email: "email@example.com", password: "email@example.com")
      visit new_user_session_path
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'email@example.com'
      click_on 'Log in'
    end

    it 'アイテム新規登録' do
      
      visit new_item_path 
      select 'Outdoor', from: 'item_main_category'
      select 'Wear', from: 'item_sub_category'
      select 'A', from: 'item_status'
      click_on 'Create My Item'
      expect(page).to have_content 'Saved...'
    end

    it 'アイテム詳細登録' do
      visit new_item_path
      select 'Outdoor', from: 'item_main_category'
      select 'Wear', from: 'item_sub_category'
      select 'A', from: 'item_status'
      click_on 'Create My Item'
      click_on 'Pricing'
      fill_in 'item_price', with: '100'
      click_on 'Save'
      click_on 'Pricing'
      fill_in 'item_price', with: '100'
      click_on 'Save'
      click_on 'Description'
      fill_in 'item_item_name', with: '100'
      fill_in 'item_summary', with: '100'
      click_on 'Save'
      click_on 'Photos'
      attach_file 'images_', "#{Rails.root}/spec/factories/sample1.jpg", make_visible: true
      click_on 'Add Photos'
      click_on 'Rental Area'
      fill_in 'autoaddress', with: 'tokyo'
      click_on 'Save'
      click_on 'Publish'
      expect(page).to have_content 'Saved...'
    end
  end
end