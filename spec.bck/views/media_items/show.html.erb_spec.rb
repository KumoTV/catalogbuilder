require 'spec_helper'

describe "media_items/show" do
  before(:each) do
    @media_item = assign(:media_item, stub_model(MediaItem,
      :media_item_name => "Media Item Name",
      :origin_s3_url => "Origin S3 Url",
      :destination_s3_url => "Destination S3 Url",
      :encoding_profile => "Encoding Profile"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Media Item Name/)
    rendered.should match(/Origin S3 Url/)
    rendered.should match(/Destination S3 Url/)
    rendered.should match(/Encoding Profile/)
  end
end
