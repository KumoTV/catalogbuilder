require 'rails_helper'

RSpec.describe "media_items/show", type: :view do
  before(:each) do
    @media_item = assign(:media_item, MediaItem.create!(
      :media_item_name => "Media Item Name",
      :origin_s3_url => "Origin S3 Url",
      :destination_s3_url => "Destination S3 Url",
      :encoding_profile => "Encoding Profile"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Media Item Name/)
    expect(rendered).to match(/Origin S3 Url/)
    expect(rendered).to match(/Destination S3 Url/)
    expect(rendered).to match(/Encoding Profile/)
  end
end
