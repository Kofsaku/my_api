class CreateItemTags < ActiveRecord::Migration[6.1]
  def change
    create_table :item_tags do |t|
      t.integer :tag_id
      t.integer :item_id

      t.timestamps
    end
  end
end
