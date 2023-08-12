require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Atif', email: 'atif@email.com', password: 'asd123')
  end
  it 'should have valid name for registration' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Should have vaild email' do
    subject.email = 'atif.com'
    expect(subject).to_not be_valid
  end
  it 'Should have valid password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
