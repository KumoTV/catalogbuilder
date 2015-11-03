require 'rails_helper'

RSpec.describe "media_items/new", type: :view do
  before(:each) do
    assign(:media_item, MediaItem.new(
      :media_item_name => "MyString",
      :origin_s3_url => "MyString",
      :destination_s3_url => "MyString",
      :encoding_profile => "MyString"
    ))
  end

  it "renders new media_item form" do
    render

    assert_select "form[action=?][method=?]", media_items_path, "post" do

      assert_select "input#media_item_media_item_name[name=?]", "media_item[media_item_name]"

      assert_select "input#media_item_origin_s3_url[name=?]", "media_item[origin_s3_url]"

      assert_select "input#media_item_destination_s3_url[name=?]", "media_item[destination_s3_url]"

      assert_select "input#media_item_encoding_profile[name=?]", "media_item[encoding_profile]"
    end
  end
end
