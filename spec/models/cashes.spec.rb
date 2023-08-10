require 'rails_helper'
RSpec.describe Wallet, type: :model do
    before :each do
        @us = User.create(name:"Atif", email:"atif@email.com", password:"asd123")
    end
    subject do 
       @cash = Cash.new(name: 'Atif', amount:20, user_id: @us.id )
    end
    before {subject.save}
    it 'should have valid item' do
        subject.name = "Item"
        expect(subject).to be_valid
    end
    it 'should have valid amount' do
        subject.amount = nil
        expect(subject).to_not be_valid
    end
    it 'Should have valid user id' do
        subject.user_id = nil
        expect(subject).to_not be_valid
    end
end
