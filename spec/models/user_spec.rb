require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'creates user with first and last name, unique email, password and matching password confirmation' do
      @user = User.new(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '123')
      @user.save

      expect(@user).to be_valid
    end

    it 'throws an error when password and matching password confirmation do not match' do
      @user = User.new(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '1234')
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'throws an error when password is blank' do
      @user = User.new(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: nil, password_confirmation: nil)
      @user.save

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'throws an error when first name is blank' do
      @user = User.new(first_name: nil, last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '123')
      @user.save

      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'throws an error when last name is blank' do
      @user = User.new(first_name: 'Tom', last_name: nil, email: 'test@test.com', password: '123', password_confirmation: '123')
      @user.save

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'throws an error when email is blank' do
      @user = User.new(first_name: 'Tom', last_name: 'Ford', email: nil, password: '123', password_confirmation: '123')
      @user.save

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'throws an error when email is not unique' do
      @user1 = User.new(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '123')
      @user1.save

      @user2 = User.new(first_name: 'Tommy', last_name: 'Fordo', email: 'TEST@TEST.com', password: '123', password_confirmation: '123')
      @user2.save

      expect(@user1).to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'throws an error when password is short' do
      @user = User.new(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '12', password_confirmation: '12')
      @user.save

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
    
  end

  describe '.authenticate_with_credentials' do
    
    it 'should allow login with correct credentials' do
      @user = User.create!(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '123')

      @login = User.authenticate_with_credentials('test@test.com', '123')
      
      expect(@user).to eq(@login)

    end

    it 'should not allow login with correct credentials' do
      @user = User.create!(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '123')

      @login = User.authenticate_with_credentials('test@test.com', '1234')
      
      expect(@login).to eq(nil)

    end

    it 'should allow login if email has whitespace' do
      @user = User.create!(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '123')

      @login = User.authenticate_with_credentials('   test@test.com  ', '123')
      
      expect(@user).to eq(@login)

    end

    it 'should allow login if email has case error' do
      @user = User.create!(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '123')

      @login = User.authenticate_with_credentials('TEST@TEST.com', '123')
      
      expect(@user).to eq(@login)

    end

    
  end
  
end
