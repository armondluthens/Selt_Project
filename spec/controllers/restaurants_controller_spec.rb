require 'spec_helper'
require 'rails_helper'


RSpec.describe RestaurantsController, type: :controller do
  
  describe "POST #create" do
    it "has a restaurant parameter" do
      post :create, {restaurant: {name: 'Blank', email: 'Blank'}}
      expect(controller.params[:restaurant]).to eq({"name" => 'Blank', "email" => 'Blank'})
    end
    context "with valid attributes" do
      before :each do
        allow(Restaurant).to receive(:exists?).with(:name => 'Test').and_return(false)
        allow(Restaurant).to receive(:exists?).with(:email => 'Test').and_return(false)
      end
      it "saves to the database" do
        expect(Restaurant).to receive(:create!).with(anything()).exactly(1).times
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
      end
      it "redirects to login page" do
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
        expect(response).to redirect_to(login_path)
      end
      it "sets the flash message" do
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
        expect(flash[:notice]).to eq("Welcome Test. Please wait for a follow-up email.")
      end
    end
    context "with name taken" do
      before :each do
        allow(Restaurant).to receive(:exists?).with(:name => 'Test').and_return(true)
        allow(Restaurant).to receive(:exists?).with(:email => 'Test').and_return(false)
      end
      it "doesn't save to the database" do
        expect(Restaurant).to_not receive(:create!)
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
      end
      it "redirects to the new restaurant page" do
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
        expect(response).to redirect_to(new_restaurant_path)
      end
      it "sets the flash message" do
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
        expect(flash[:notice]).to eq("Restaurant name is unavailable. Try again.")
      end
    end
    context "with account already registered" do
      before :each do
        allow(Restaurant).to receive(:exists?).with(:name => 'Test').and_return(false)
        allow(Restaurant).to receive(:exists?).with(:email => 'Test').and_return(true)
      end
      it "doesn't save to the database" do
        expect(Restaurant).to_not receive(:create!)
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
      end
      it "redirects to the login page" do
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
        expect(response).to redirect_to(login_path)
      end
      it "sets the flash message" do
        post :create, {restaurant: {name: 'Test', email: 'Test'}}
        expect(flash[:notice]).to eq("Email is already registered with an account. Please log in or inquiry forgotten password.")
      end
    end
  end
  
  describe "GET #index" do
    it "should show index" do
      get :index
      expect(response).to render_template('index')
    end
    it "should set variable restaurants" do
      expect(Restaurant).to receive(:all).and_return(["Test1", "Test2"])
      get :index
      expect(assigns(:restaurants)).to eq(["Test1","Test2"])
    end
  end
  
  describe "GET #edit" do
    
  end
  
  describe "GET #show" do
    it "should render show" do
      expect(Restaurant).to receive(:find)
      get :show, id: 1
      expect(response).to render_template('show')
    end
    it "should set variable restaurant" do
      fake_restaurant = double("Test1")
      expect(Restaurant).to receive(:find).and_return(fake_restaurant)
      get :show, id: 1
      expect(assigns(:restaurant)).to eq(fake_restaurant)
    end
  end
end