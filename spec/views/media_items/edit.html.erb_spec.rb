require 'spec_helper'

describe "media_items/edit" do
  before(:each) do
    @media_item = assign(:media_item, stub_model(MediaItem,
      :media_item_name => "MyString",
      :origin_s3_url => "MyString",
      :destination_s3_url => "MyString",
      :encoding_profile => "MyString"
    ))
  end

  it "renders the edit media_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", media_item_path(@media_item), "post" do
      assert_select "input#media_item_media_item_name[name=?]", "media_item[media_item_name]"
      assert_select "input#media_item_origin_s3_url[name=?]", "media_item[origin_s3_url]"
      assert_select "input#media_item_destination_s3_url[name=?]", "media_item[destination_s3_url]"
      assert_select "input#media_item_encoding_profile[name=?]", "media_item[encoding_profile]"
    end
  end
end
