require 'rails_helper'

RSpec.describe DealsController, type: :controller do

  describe "param function" do
    it "blocks incorrect parameters" do
      controller.params = {deal: {title: "blank", incorrect: "not supposed to be here"}}
      expect(controller.deal_params()).to eq({"title" => "blank"})
    end
    it "passes correct parameters" do
      controller.params = {deal: {title: "blank", description: "double blank"}}
      expect(controller.deal_params()).to eq({"title" => "blank", "description" => "double blank"})
    end
  end

  describe "GET #create" do
    let(:deal) do
      stub_model Deal,  :title => "Test",
                        :restaurant_name => "Rest Test",
                        :save => true
    end
    let(:restaurant) do
      mock_model Restaurant, :name => "Rest Test",
                             :save => true
    end
    before :each do
        @fake_params = {title: "title", start_date: '01/20/15', end_date: '02/20/15', 
                        description: 'test deal', start_time: '17:00', end_time: '18:00',
                        sunday: false, monday: false, tuesday: false, wednesday: false, 
                        thursday: true, friday: true, saturday: false, ethnicity: 'Mexican'}
        allow_any_instance_of(DealsController).to receive(:deal_params).and_return(@fake_params)
        allow(Deal).to receive(:create_deal!).with(@fake_params).and_return(deal)
        controller.instance_variable_set(:@current_restaurant, restaurant)
    end
    it "returns http success" do
      get :create, {deal: @fake_params}
      expect(response).to have_http_status(302)
    end
    it "creates an instance variable deal" do
      get :create, {deal: @fake_params}
      expect(assigns(:deal)).to eq(deal)
    end
    it "creates a deal" do
      expect(Deal).to receive(:create_deal!).with(@fake_params).and_return(deal)
      controller.instance_variable_set(:@current_restaurant, restaurant)
      allow_any_instance_of(Deal).to receive(:update_attributes!).with(@fake_params)
      get :create, {deal: @fake_params}
    end 
    it "updates the flash" do
      get :create, {deal: @fake_params}
      expect(flash[:notice]).to eq("title was successfully created")
    end
    it "redirects to deal_path" do
      get :create, {deal: @fake_params}
      expect(response).to redirect_to(deal_path(deal))
    end
  end

  describe "GET #show" do
    let(:deal) do
      stub_model Deal,  :title => "Test",
                        :restaurant_name => "Rest Test",
                        :save => true
    end
    let(:restaurant) do
      mock_model Restaurant, :name => "Rest Test",
                             :save => true
    end
    before :each do
        @fake_params = {title: "title", start_date: '01/20/15', end_date: '02/20/15', 
                        description: 'test deal', start_time: '17:00', end_time: '18:00',
                        sunday: false, monday: false, tuesday: false, wednesday: false, 
                        thursday: true, friday: true, saturday: false, ethnicity: 'Mexican'}
        allow_any_instance_of(DealsController).to receive(:deal_params).and_return(@fake_params)
        allow(Deal).to receive(:create_deal!).with(@fake_params).and_return(deal)
        controller.instance_variable_set(:@current_restaurant, restaurant)
    end
    it "returns http success" do
      allow(Deal).to receive(:find).and_return(deal)
      get :show, :id => deal.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    let(:deal) do
      stub_model Deal,  :title => "Test",
                        :id => 1,
                        :restaurant_name => "Rest Test",
                        :save => true
    end
    before :each do
      @fake_params = {title: "title", start_date: '01/20/15', end_date: '02/20/15', 
                      description: 'test deal', start_time: '17:00', end_time: '18:00',
                      sunday: false, monday: false, tuesday: false, wednesday: false, 
                      thursday: true, friday: true, saturday: false, ethnicity: 'Mexican'}
      allow_any_instance_of(DealsController).to receive(:deal_params).and_return(@fake_params)
      allow(Deal).to receive(:find).and_return(deal)
    end
    it "returns http success" do
      allow_any_instance_of(Deal).to receive(:update_attributes!).and_return(deal)
      expect(Deal).to receive(:create_deal!).with(@fake_params).and_return(deal)
      patch :update, :id => deal.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      allow_any_instance_of(Deal).to receive(:update_attributes!).and_return(deal)
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
