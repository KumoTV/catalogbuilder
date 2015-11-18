require "rails_helper"

RSpec.describe EncodingProfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/encoding_profiles").to route_to("encoding_profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/encoding_profiles/new").to route_to("encoding_profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/encoding_profiles/1").to route_to("encoding_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/encoding_profiles/1/edit").to route_to("encoding_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/encoding_profiles").to route_to("encoding_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/encoding_profiles/1").to route_to("encoding_profiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/encoding_profiles/1").to route_to("encoding_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/encoding_profiles/1").to route_to("encoding_profiles#destroy", :id => "1")
    end

  end
end
