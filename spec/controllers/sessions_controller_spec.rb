require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    context "with valid session" do
      let(:restaurant) do
        @fake_token = SecureRandom.base64;
        mock_model Restaurant, :name => "Test",
                               :session_token => @fake_token,
                               :authenticate => true,
                               :save => true
      end
      before :each do
        @fake_params = {email: 'test@email.com', password: 'password', session_token: SecureRandom.base64}
        allow_any_instance_of(SessionsController).to receive(:session_params).and_return(@fake_params)
        allow(Restaurant).to receive(:find_by_email).and_return(restaurant)
      end
      it "should return http success" do
        get :create, {session: @fake_params}
        expect(response).to have_http_status(302)
      end
      it "should return to home page" do
        get :create, {session: @fake_params}
        expect(response).to redirect_to(root_path)
      end
      it "should set flash message" do
        get :create, {session: @fake_params}
        expect(flash[:notice]).to eq("You are logged in as Test.")
      end
      it "should set the session token" do
        get :create, {session: @fake_params}
        expect(session[:session_token]).to eq(@fake_token)
      end
    end
    context "with invalid session by" do
      context "no such restaurant" do
        let(:restaurant) do
          @fake_token = SecureRandom.base64;
          mock_model Restaurant, :name => "Test",
                                 :session_token => @fake_token,
                                 :authenticate => true,
                                 :save => true
        end
        before :each do
          @fake_params = {email: 'test@email.com', password: 'password', session_token: SecureRandom.base64}
          allow_any_instance_of(SessionsController).to receive(:session_params).and_return(@fake_params)
          allow(Restaurant).to receive(:find_by_email).and_return(nil)
        end
        it "should return to login page" do
          get :create, {session: @fake_params}
          expect(response).to redirect_to(login_path)
        end
        it "should set flash message" do
          get :create, {session: @fake_params}
          expect(flash[:notice]).to eq("Invalid credentials. Re-enter, or click Sign-up for an account")
        end
        it "should not set the session token" do
          get :create, {session: @fake_params}
          expect(session[:session_token]).to_not eq('TestToken')
          expect(session[:session_token]).to be_nil
        end
      end
      context "incorrect password" do
        let(:restaurant) do
          @fake_token = SecureRandom.base64;
          mock_model Restaurant, :name => "Test",
                                 :session_token => @fake_token,
                                 :authenticate => false,
                                 :save => true
        end
        before :each do
          @fake_params = {email: 'test@email.com', password: 'password', session_token: SecureRandom.base64}
          allow_any_instance_of(SessionsController).to receive(:session_params).and_return(@fake_params)
          allow(Restaurant).to receive(:find_by_email).and_return(restaurant)
        end
        it "should authenticate password"
        it "should return to login page" do
          get :create, {session: {name: "Test", password: "Test"}}
          expect(response).to redirect_to(login_path)
        end
        it "should set flash message" do
          get :create, {session: {name: "Test", password: "Test"}}
          expect(flash[:notice]).to eq("Invalid credentials. Re-enter, or click Sign-up for an account")
        end
        it "should not set the session token" do
          get :create, {session: {name: "Test", password: "Test"}}
          expect(session[:session_token]).to_not eq('TestToken')
          expect(session[:session_token]).to be_nil
        end
      end
    end
  end

  describe "GET #destroy" do
    #it "returns http success" do
    #  get :destroy
    #  expect(response).to have_http_status(:success)
    #end
    it "should reset the session" do
      delete :destroy
      expect(session[:session_token]).to be_nil
    end
    it "should return to home page" do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end

end
