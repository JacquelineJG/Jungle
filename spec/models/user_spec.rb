require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is valid" do
      user = User.new(
        fist_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it "checks for if passwords don't match" do
      user = User.new(
        fist_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'bananas'
      )
      user.valid?
      expect(user.errors[:password_confirmation]).to be_present
    end

    it "checks if email is missing" do
      user = User.new(email: nil)
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("can't be blank")
  
      user.email = 'test@test.com' 
      user.valid?
      expect(user.errors[:email]).not_to include("can't be blank")
    end

    it "checks if first name is missing" do
      user = User.new(fist_name: nil)
      expect(user).to be_invalid
      expect(user.errors[:fist_name]).to include("can't be blank")
  
      user.fist_name = 'first_name' 
      user.valid? 
      expect(user.errors[:fist_name]).not_to include("can't be blank")
    end

    it "checks if last name is missing" do
      user = User.new(last_name: nil)
      expect(user).to be_invalid
      expect(user.errors[:last_name]).to include("can't be blank")
  
      user.last_name = 'last_name' 
      user.valid? 
      expect(user.errors[:last_name]).not_to include("can't be blank")
    end

    it 'checks that email is unique' do
      user = User.new
      user.fist_name = 'first_name'
      user.last_name = 'last_name'
      user.email = 'test@test.com'
      user.password = 'password'
      user.password_confirmation = 'password'

      user.save
    
      user2 = User.new
      user2.fist_name = 'first_name'
      user2.last_name = 'last_name'
      user2.email = 'test@test.com'
      user2.password = 'password'
      user2.password_confirmation = 'password'
      user2.save
    
      expect(user2.errors[:email].first).to eq('has already been taken')
    end

    it 'checks that a password length less than 5 characters is invalid' do
      user = User.new
      user.fist_name = 'first_name'
      user.last_name = 'last_name'
      user.email = 'test@test.com'
      user.password = '1234'
      user.password_confirmation = '1234'
      expect(user).to be_invalid
    end

    it 'checks that a password length is at least 5 characters' do
      user = User.new
      user.fist_name = 'first_name'
      user.last_name = 'last_name'
      user.email = 'test@test.com'
      user.password = '12345'
      user.password_confirmation = '12345'
      expect(user).to be_valid
    end
  end
  
  describe '.authenticate_with_credentials' do
    it 'should pass with valid credentials' do
      user = User.new(
        fist_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(user).not_to be(nil)
    end

    it 'should not pass with invalid credentials' do
      user = User.new(
        fist_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@test.com', 'bananas')
      expect(user).to be(nil)
    end

    it 'should pass even with spaces present in email' do
      user = User.new(
        fist_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('  test@test.com  ', 'password')
      expect(user).not_to be(nil)
    end

    it 'should pass even with caps present in email' do
      user = User.new(
        fist_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('TEST@test.com', 'password')
      expect(user).not_to be(nil)
    end
  end

end