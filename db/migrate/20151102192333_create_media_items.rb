class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.string :media_item_name
      t.string :origin_s3_url
      t.string :destination_s3_url
      t.string :encoding_profile

      t.timestamps null: false
    end
  end
end
