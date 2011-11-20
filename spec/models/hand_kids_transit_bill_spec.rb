require 'spec_helper'

describe HandKidsTransitBill do
  before(:each) do
    @hand_kids_transit_bill = Factory.build(:hand_kids_transit_bill)
  end
  it "应能够成功创建一张手工童装票据" do
    @hand_kids_transit_bill.save!
  end

end
