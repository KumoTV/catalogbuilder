require "rails_helper"

RSpec.describe MediaItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/media_items").to route_to("media_items#index")
    end

    it "routes to #new" do
      expect(:get => "/media_items/new").to route_to("media_items#new")
    end

    it "routes to #show" do
      expect(:get => "/media_items/1").to route_to("media_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/media_items/1/edit").to route_to("media_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/media_items").to route_to("media_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/media_items/1").to route_to("media_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/media_items/1").to route_to("media_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/media_items/1").to route_to("media_items#destroy", :id => "1")
    end

  end
end
