require 'rails_helper'

RSpec.describe Group, type: :model do
  @user = User.create(name: 'atif')
  subject do
    Group.new(name: 'easypasia', icon: Rack::Test::UploadedFile.new('spec/media/easypaisa.png'))
  end
  before { subject.save }
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Should have valid icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
