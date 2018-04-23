require "spec_helper"

describe MthSettlementsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/mth_settlements" }.should route_to(:controller => "mth_settlements", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/mth_settlements/new" }.should route_to(:controller => "mth_settlements", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/mth_settlements/1" }.should route_to(:controller => "mth_settlements", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/mth_settlements/1/edit" }.should route_to(:controller => "mth_settlements", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/mth_settlements" }.should route_to(:controller => "mth_settlements", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/mth_settlements/1" }.should route_to(:controller => "mth_settlements", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/mth_settlements/1" }.should route_to(:controller => "mth_settlements", :action => "destroy", :id => "1")
    end

  end
end
