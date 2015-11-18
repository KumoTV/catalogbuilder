json.array!(@media_items) do |media_item|
  json.extract! media_item, :id, :media_item_id, :s3_input_key, :s3_output_key, :cloudfront_url
  json.url media_item_url(media_item, format: :json)
end
