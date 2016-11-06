require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    pending
    #it "returns http success" do
    #  get :new
    #  expect(response).to have_http_status(:success)
    #end
  end

  describe "GET #create" do
    #it "returns http success" do
    #  get :create, {restaurant: {name: "Test", password: "Test"}}
    #  expect(response).to have_http_status(:success)
    #end
    context "with valid session" do
      before :each do
        fake_results = double('Test', :name => 'Test', :session_token => 'TestToken')
        allow(Restaurant).to receive(:find_by).with(name: "Test", password: "Test").and_return(fake_results)
      end
      it "should return to home page" do
        get :create, {restaurant: {name: "Test", password: "Test"}}
        expect(response).to redirect_to(root_path)
      end
      it "should set flash message" do
        get :create, {restaurant: {name: "Test", password: "Test"}}
        expect(flash[:notice]).to eq("You are logged in as Test.")
      end
      it "should set the session token" do
        get :create, {restaurant: {name: "Test", password: "Test"}}
        expect(session[:session_token]).to eq('TestToken')
      end
    end
    context "with invalid session" do
      before :each do
        allow(Restaurant).to receive(:find_by).with(name: "Test", password: "Test").and_return(nil)
      end
      it "should return to login page" do
        get :create, {restaurant: {name: "Test", password: "Test"}}
        expect(response).to redirect_to(login_path)
      end
      it "should set flash message" do
        get :create, {restaurant: {name: "Test", password: "Test"}}
        expect(flash[:notice]).to eq("Invalid credentials. Re-enter, or click Sign-up for an account")
      end
      it "should not set the session token" do
        get :create, {restaurant: {name: "Test", password: "Test"}}
        expect(session[:session_token]).to_not eq('TestToken')
        expect(session[:session_token]).to be_nil
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
