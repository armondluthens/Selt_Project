require 'spec_helper'
require 'rails_helper'


RSpec.describe RestaurantsController, type: :controller do
  
  describe "POST #create" do
    it "has a restaurant parameter" do
      post :create, {restaurant: {name: 'Blank', email: 'Blank@email.com', password: "password", password_confirmation: "password", location: "loc", contact: "123", description: "descipt"}}
      expect(controller.params[:restaurant]).to eq({'name' => 'Blank', 'email' => 'Blank@email.com', 'password' => 'password', 'password_confirmation' => 'password', 'location' => 'loc', 'contact' => '123', 'description' => 'descipt'})
    end
    context "with valid attributes" do
      before :each do
        @fake_res = double('Sudo', :name => "Name", :email => "test@email.com")
        allow_any_instance_of(RestaurantsController).to receive(:restaurant_params)
        allow(Restaurant).to receive(:new).with(anything()).and_return(@fake_res)
        allow(Restaurant).to receive(:exists?).and_return(false)
      end
      it "saves to the database" do
        expect(Restaurant).to receive(:create_restaurant!).with(anything()).exactly(1).times
        post :create, {restaurant: Hash.new}
      end
      it "redirects to login page" do
        allow(Restaurant).to receive(:create_restaurant!).with(anything())
        post :create, {restaurant: Hash.new}
        expect(response).to redirect_to(login_path)
      end
      it "sets the flash message" do
        allow(Restaurant).to receive(:create_restaurant!).with(anything())
        post :create, {restaurant: @fake_res}
        expect(flash[:notice]).to eq("Welcome Name. Your account was successfully created.")
      end
    end
    context "with account already taken" do
      before :each do
        @fake_res = double('Sudo', :name => "Name", :email => "test@email.com")
        allow_any_instance_of(RestaurantsController).to receive(:restaurant_params)
        allow(Restaurant).to receive(:new).with(anything()).and_return(@fake_res)
        allow(Restaurant).to receive(:exists?).and_return(true)
      end
      it "doesn't save to the database" do
        expect(Restaurant).to_not receive(:create!)
        post :create, {restaurant: Hash.new}
      end
      it "redirects to the new restaurant page" do
        post :create, {restaurant: Hash.new}
        expect(response).to redirect_to(new_restaurant_path)
      end
      it "sets the flash message" do
        post :create, {restaurant: @fake_res}
        expect(flash[:notice]).to eq("Account test@email.com already exists. Please try again.")
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