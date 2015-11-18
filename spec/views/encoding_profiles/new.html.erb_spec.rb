require 'rails_helper'

RSpec.describe "encoding_profiles/new", type: :view do
  before(:each) do
    assign(:encoding_profile, EncodingProfile.new(
      :preset_id => "MyString",
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new encoding_profile form" do
    render

    assert_select "form[action=?][method=?]", encoding_profiles_path, "post" do

      assert_select "input#encoding_profile_preset_id[name=?]", "encoding_profile[preset_id]"

      assert_select "input#encoding_profile_name[name=?]", "encoding_profile[name]"

      assert_select "input#encoding_profile_description[name=?]", "encoding_profile[description]"
    end
  end
end
