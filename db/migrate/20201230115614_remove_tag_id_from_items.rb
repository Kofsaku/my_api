class RemoveTagIdFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :tag_id, :integer
  end
end
