require 'rails_helper'

RSpec.describe "media_items/show", type: :view do
  before(:each) do
    @media_item = assign(:media_item, MediaItem.create!(
      :media_item_id => "Media Item",
      :s3_input_key => "S3 Input Key",
      :s3_output_key => "S3 Output Key",
      :cloudfront_url => "Cloudfront Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Media Item/)
    expect(rendered).to match(/S3 Input Key/)
    expect(rendered).to match(/S3 Output Key/)
    expect(rendered).to match(/Cloudfront Url/)
  end
end
