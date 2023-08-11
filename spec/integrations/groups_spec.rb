require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  describe 'new' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      @user = User.create(name: 'Atif', email: 'atif@email.com', password: 'asd12345')
      @group = Group.create(name: 'easypaisa',
                            icon: Rack::Test::UploadedFile.new("#{Rails.root}/spec/media/alibaba.jpg"))
      visit new_user_session_path
      fill_in 'Email', with: 'atif@email.com'
      fill_in 'Password', with: 'asd12345'
      click_button 'Log in'
    end
    it 'Should have data' do
      expect(page).to have_content('Your Catogeries')
      expect(page).to have_content('Back')
    end
    it 'New group shouild be added' do
      click_link 'Add New Category'
      expect(page).to have_content('Name')
      expect(page).to have_content('Add Catogery')
      fill_in 'Name', with: 'Test_Item'
      attach_file('Icon', "#{Rails.root}/spec/media/alibaba.jpg")
      click_button 'Submit'
      visit root_path
      expect(page).to have_content('Test_Item')
      expect(page).to have_content(0)
    end
  end
end
