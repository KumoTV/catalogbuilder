class UniqueNameInMediaItems < ActiveRecord::Migration
  def change
    add_index :media_items, :media_item_name, unique: true
  end
end
