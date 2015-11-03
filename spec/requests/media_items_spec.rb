require 'rails_helper'

RSpec.describe "MediaItems", type: :request do
  describe "GET /media_items" do
    it "works! (now write some real specs)" do
      get media_items_path
      expect(response).to have_http_status(200)
    end
  end
end
