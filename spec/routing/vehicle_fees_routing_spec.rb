require "spec_helper"

describe VehicleFeesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/vehicle_fees" }.should route_to(:controller => "vehicle_fees", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vehicle_fees/new" }.should route_to(:controller => "vehicle_fees", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/vehicle_fees/1" }.should route_to(:controller => "vehicle_fees", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vehicle_fees/1/edit" }.should route_to(:controller => "vehicle_fees", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vehicle_fees" }.should route_to(:controller => "vehicle_fees", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/vehicle_fees/1" }.should route_to(:controller => "vehicle_fees", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vehicle_fees/1" }.should route_to(:controller => "vehicle_fees", :action => "destroy", :id => "1")
    end

  end
end
