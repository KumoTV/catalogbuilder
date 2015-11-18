require 'rails_helper'

RSpec.describe "encoding_profiles/index", type: :view do
  before(:each) do
    assign(:encoding_profiles, [
      EncodingProfile.create!(
        :preset_id => "Preset",
        :name => "Name",
        :description => "Description"
      ),
      EncodingProfile.create!(
        :preset_id => "Preset",
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of encoding_profiles" do
    render
    assert_select "tr>td", :text => "Preset".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
