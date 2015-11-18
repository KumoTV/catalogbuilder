require 'rails_helper'

RSpec.describe "encoding_profiles/edit", type: :view do
  before(:each) do
    @encoding_profile = assign(:encoding_profile, EncodingProfile.create!(
      :preset_id => "MyString",
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit encoding_profile form" do
    render

    assert_select "form[action=?][method=?]", encoding_profile_path(@encoding_profile), "post" do

      assert_select "input#encoding_profile_preset_id[name=?]", "encoding_profile[preset_id]"

      assert_select "input#encoding_profile_name[name=?]", "encoding_profile[name]"

      assert_select "input#encoding_profile_description[name=?]", "encoding_profile[description]"
    end
  end
end
