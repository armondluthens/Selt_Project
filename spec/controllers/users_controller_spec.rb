require 'spec_helper'
require 'rails_helper'

describe UsersController do
    
    describe 'when new' do
        subject {@test_user = User.create_user!(:user_id => testID, :email => testEmail, :password => testPassword)}
        it { should be_valid }
    end
    
    describe 'when all fields are specified in registration form' do
        context 'and distinct' do
        subject {@test_user.testID = 'Pancheros' ; @test_user.email = 'panch@gmail.com' ; @test_user.password = 'test_pw'}
        it {should be_valid}
        its(:user_id) { should == 'Pancheros' }
        its(:email)  { should == 'panch@gmail.com' }
        its(:password) { should == 'test_pw' } # may need to be changed to due encryption?
        end
    
    end
    
end