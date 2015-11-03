require "rails_helper"

RSpec.feature "Media Items management", :type => :feature do
  scenario "User creates a new media item" do
    def create_media_item(options = {})
      ts = Time.now.strftime('%Y%m%d%H%M%S')
      options[:name] ||= "TEST_MEDIA_ITEM_#{ts}"
      options[:origin_s3_url] ||= "s3://test_bucket/assets/raw/test_#{ts}.mp4"
      options[:destination_s3_url] ||= "TEST_MEDIA_ITEM_#{ts}"
      options[:encoding_profile] ||= "HLS_DEFAULT_FULL_HD"
      visit "/media_items/new"
      expect(page).to have_text("New Media Item")
      fill_in "Media item name", :with => "MY_MEDIA_ITEM_#{ts}"
      fill_in "Origin s3 url", :with => "s3://test_bucket/assets/raw/mymediaitem.ts"
      fill_in "Destination s3 url", :with => "s3://test_bucket/assets/"
      fill_in "Encoding profile", :with => "HLS_DEFAULT_FULL_HD"
      click_button "Create Media item"
      expect(page).to have_text("Media item was successfully created.")
    end
  end
end
