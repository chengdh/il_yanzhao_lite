require "spec_helper"

describe DivideInfosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/divide_infos" }.should route_to(:controller => "divide_infos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/divide_infos/new" }.should route_to(:controller => "divide_infos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/divide_infos/1" }.should route_to(:controller => "divide_infos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/divide_infos/1/edit" }.should route_to(:controller => "divide_infos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/divide_infos" }.should route_to(:controller => "divide_infos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/divide_infos/1" }.should route_to(:controller => "divide_infos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/divide_infos/1" }.should route_to(:controller => "divide_infos", :action => "destroy", :id => "1")
    end

  end
end
