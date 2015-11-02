json.array!(@media_items) do |media_item|
  json.extract! media_item, :id, :media_item_name, :origin_s3_url, :destination_s3_url, :encoding_profile
  json.url media_item_url(media_item, format: :json)
end
