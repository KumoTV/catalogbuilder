require 'spec_helper'

describe "media_items/index" do
  before(:each) do
    assign(:media_items, [
      stub_model(MediaItem,
        :media_item_name => "Media Item Name",
        :origin_s3_url => "Origin S3 Url",
        :destination_s3_url => "Destination S3 Url",
        :encoding_profile => "Encoding Profile"
      ),
      stub_model(MediaItem,
        :media_item_name => "Media Item Name",
        :origin_s3_url => "Origin S3 Url",
        :destination_s3_url => "Destination S3 Url",
        :encoding_profile => "Encoding Profile"
      )
    ])
  end

  it "renders a list of media_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Media Item Name".to_s, :count => 2
    assert_select "tr>td", :text => "Origin S3 Url".to_s, :count => 2
    assert_select "tr>td", :text => "Destination S3 Url".to_s, :count => 2
    assert_select "tr>td", :text => "Encoding Profile".to_s, :count => 2
  end
end
