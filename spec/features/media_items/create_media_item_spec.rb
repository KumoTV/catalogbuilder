require "rails_helper"

RSpec.feature "Media Items management", :type => :feature do
    def create_media_item(options = {})
      ts = Time.now.strftime('%Y%m%d%H%M%S')
      options[:name] ||= "TEST_MEDIA_ITEM_#{ts}"
      options[:origin_s3_url] ||= "s3://test_bucket/assets/raw/test_#{ts}.mp4"
      options[:destination_s3_url] ||= "s3://test_bucket/assets/transcoded/#{ts}"
      options[:encoding_profile] ||= "HLS_DEFAULT_FULL_HD"
      visit "/media_items/new"
      expect(page).to have_text("New Media Item")
      fill_in "Media item name", :with => options[:name]
      fill_in "Origin s3 url", :with => options[:origin_s3_url]
      fill_in "Destination s3 url", :with => options[:destination_s3_url]
      fill_in "Encoding profile", :with => options[:encoding_profile]
      click_button "Create Media item"
    end
  
  scenario "User creates a new media item" do
    create_media_item
    expect(page).to have_text("Media item was successfully created.")
  end
  
  scenario "Redirects to media item index on success" do
    create_media_item
    expect(page).to have_text("Media item was successfully created.")
    click_link "Back"
    expect(page).to have_text("Listing Media Items")
  end
  
  scenario "Fails if origin s3 url is not valid" do
    create_media_item({:origin_s3_url => "s3://test/test2/novalid"})
    expect(page).to have_text("Origin s3 url That is not valid source s3 url for a raw asset.")
  end
  
  scenario "Fails if destination s3 url is not valid" do
    create_media_item({:destination_s3_url => "s4://test/test2/novalid/"})
    expect(page).to have_text("Destination s3 url That is not a valid destination s3 url for an encoded asset.")
  end
end
