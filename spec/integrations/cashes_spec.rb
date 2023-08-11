require 'rails_helper'

RSpec.describe 'cash', type: :feature do
  describe 'Create new group' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      @user = User.create(name: 'Atif', email: 'atif@email.com', password: 'asd123')
      @group = Group.create(name: 'easypaisa', icon: Rack::Test::UploadedFile.new("#{Rails.root}/spec/media/alibaba.jpg"))
      visit new_user_session_path
      fill_in 'Email', with: 'atif@email.com'
      fill_in 'Password', with: 'asd123'
      click_button 'Log in'
      click_link 'Add New Category'
      fill_in 'Name', with: 'easypaisa'
      attach_file('Icon', "#{Rails.root}/spec/media/alibaba.jpg")
      click_button 'Submit'
      visit root_path
      click_link 'easypaisa'
      click_link 'Add New'
      fill_in 'Name', with: 'New_Item'
      fill_in 'Amount', with: 200
      click_button 'Submit'
      expect(page).to have_content('easypaisa')
    end
    it 'Create new cash' do
      visit root_path
      click_link 'easypaisa'
      click_link 'New_Item'
      expect(page).to have_content('200')
      expect(page).to have_content('easypaisa')
      expect(page).to have_content('New_Item')
      expect(page).to have_content('Go back')
    end
  end
end
