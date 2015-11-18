require 'rails_helper'

RSpec.describe "media_items/edit", type: :view do
  before(:each) do
    @media_item = assign(:media_item, MediaItem.create!(
      :media_item_id => "MyString",
      :s3_input_key => "MyString",
      :s3_output_key => "MyString",
      :cloudfront_url => "MyString"
    ))
  end

  it "renders the edit media_item form" do
    render

    assert_select "form[action=?][method=?]", media_item_path(@media_item), "post" do

      assert_select "input#media_item_media_item_id[name=?]", "media_item[media_item_id]"

      assert_select "input#media_item_s3_input_key[name=?]", "media_item[s3_input_key]"

      assert_select "input#media_item_s3_output_key[name=?]", "media_item[s3_output_key]"

      assert_select "input#media_item_cloudfront_url[name=?]", "media_item[cloudfront_url]"
    end
  end
end
