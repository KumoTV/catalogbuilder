class MediaItem < ActiveRecord::Base
  validates_presence_of :media_item_name, :origin_s3_url, :destination_s3_url
  validates_uniqueness_of :media_item_name
  validates :origin_s3_url, format: 
                                    { with: /s3:\/\/(([^\/]+)\/(.*?([^\/]+)\.(ts|avi|mp4|mov)))/,
                                      message: "That is not valid source s3 url for a raw asset."}
  validates :destination_s3_url, format: 
                                        { with: /s3:\/\/(([^\/]+)\/(.*?([^\/]+))\/?)/,
                                          message: "That is not a valid destination s3 url for an encoded asset."}
end
