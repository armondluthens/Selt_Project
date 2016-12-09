require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe "adding deal" do
    it "should call Deal create" do
      fake_params = {fake1: double('param1'), fake2: double('param2')}
      expect(Deal).to receive(:create!)
      Deal.create_deal!(fake_params)
    end
  end
  describe "searching" do
    it 'should not call where if search is blank' do
      expect(Deal).to_not receive(:where)
      Deal.search(nil)
    end
    it 'should call where if search isn\'t blank' do
      expect(Deal).to receive(:where)
      Deal.search("Blank")
    end
  end
end
