require 'spec_helper'
require 'rails_helper'

describe UsersController do
    describe 'creating a new user' do
       it 'calls the method User.create_user! that creates a new account'
        post :User.create_user, {:user_id => 'test_id', :email => 'test_email', :password => 'test_password'}
    end
end