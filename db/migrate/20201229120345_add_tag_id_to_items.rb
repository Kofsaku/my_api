class AddTagIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :tag_id, :integer
  end
end
