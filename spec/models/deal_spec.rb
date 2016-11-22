require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe "adding deal" do
    it "should call Deal create" do
      fake_params = {fake1: double('param1'), fake2: double('param2')}
      expect(Deal).to receive(:create!)
      Deal.create_deal!(fake_params)
    end
  end
end
