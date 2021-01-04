class RemoveItemIdFromTags < ActiveRecord::Migration[6.1]
  def change
    remove_column :tags, :item_id, :integer
  end
end
