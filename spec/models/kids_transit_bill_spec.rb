require 'spec_helper'

describe KidsTransitBill do
  before(:each) do
    @kids_transit_bill = Factory.build(:kids_transit_bill)
  end
  it "应能够成功创建一张机打童装票据" do
    @kids_transit_bill.save!
  end
end
