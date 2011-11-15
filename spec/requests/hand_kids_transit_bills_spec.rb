require 'spec_helper'

describe "HandKidsTransitBills" do
  describe "GET /hand_kids_transit_bills" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get hand_kids_transit_bills_path
      response.status.should be(200)
    end
  end
end
