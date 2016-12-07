require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'adding restaurant' do
    it 'should create a session token' do
       expect(SecureRandom).to receive(:base64).and_return('012345678901234567890123')
       restaurant = Restaurant.create_restaurant!(name: 'Test', email: 'Test@email.com', password: "password", password_confirmation: "password", location: "some dark alley", contact: "gregg", description: "a bad deal")
       expect(restaurant).to have_attributes(:session_token => '012345678901234567890123')
    end
    it 'should call Restaurant create' do
        fake_params = {fake1: double('param1'), fake2: double('param2')}
        expect(SecureRandom).to receive(:base64)
        expect(Restaurant).to receive(:create!)
        Restaurant.create_restaurant!(fake_params)
    end
    it 'should be valid with valid attributes' do
        restaurant = Restaurant.create_restaurant!(name: 'Test', email: 'Test@email.com', password: "password", password_confirmation: "password", location: "some dark alley", contact: "gregg", description: "a bad deal")
        expect(restaurant).to be_valid
    end
    it 'should not be valid with incorrect email' do
        restaurant = Restaurant.new(name: 'Test', email: 'incorrectemail')
        expect(restaurant).to_not be_valid
    end
    it 'should be invalid without name' do
        restaurant = Restaurant.new(name: nil)
        expect(restaurant).to_not be_valid
    end
    it 'should be invalid without email' do
        restaurant = Restaurant.new(email: nil)
        expect(restaurant).to_not be_valid
    end
  end
end
