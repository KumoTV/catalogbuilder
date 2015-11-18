require 'rails_helper'

RSpec.describe "media_items/index", type: :view do
  before(:each) do
    assign(:media_items, [
      MediaItem.create!(
        :media_item_id => "Media Item",
        :s3_input_key => "S3 Input Key",
        :s3_output_key => "S3 Output Key",
        :cloudfront_url => "Cloudfront Url"
      ),
      MediaItem.create!(
        :media_item_id => "Media Item",
        :s3_input_key => "S3 Input Key",
        :s3_output_key => "S3 Output Key",
        :cloudfront_url => "Cloudfront Url"
      )
    ])
  end

  it "renders a list of media_items" do
    render
    assert_select "tr>td", :text => "Media Item".to_s, :count => 2
    assert_select "tr>td", :text => "S3 Input Key".to_s, :count => 2
    assert_select "tr>td", :text => "S3 Output Key".to_s, :count => 2
    assert_select "tr>td", :text => "Cloudfront Url".to_s, :count => 2
  end
end
