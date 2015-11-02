require "spec_helper"

describe MediaItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/media_items").should route_to("media_items#index")
    end

    it "routes to #new" do
      get("/media_items/new").should route_to("media_items#new")
    end

    it "routes to #show" do
      get("/media_items/1").should route_to("media_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/media_items/1/edit").should route_to("media_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/media_items").should route_to("media_items#create")
    end

    it "routes to #update" do
      put("/media_items/1").should route_to("media_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/media_items/1").should route_to("media_items#destroy", :id => "1")
    end

  end
end
