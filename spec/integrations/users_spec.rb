require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'new' do
    before(:each) do
      User.destroy_all
      @user = User.create(name: 'Atif', email: 'atif@email.com', password: 'asd1234')
    end
    it 'Sign up' do
      visit '/users/sign_up'
      expect(page).to have_content('Password confirmation')
      expect(page).to have_content('Name')
      expect(page).to have_content('Sign up')
    end
    it 'Sign in' do
      visit 'users/sign_in'
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
    end
  end
end
