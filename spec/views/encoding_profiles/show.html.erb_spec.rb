require 'rails_helper'

RSpec.describe "encoding_profiles/show", type: :view do
  before(:each) do
    @encoding_profile = assign(:encoding_profile, EncodingProfile.create!(
      :preset_id => "Preset",
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Preset/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
