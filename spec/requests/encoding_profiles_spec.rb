require 'rails_helper'

RSpec.describe "EncodingProfiles", type: :request do
  describe "GET /encoding_profiles" do
    it "works! (now write some real specs)" do
      get encoding_profiles_path
      expect(response).to have_http_status(200)
    end
  end
end
