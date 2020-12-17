class AddDetailsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :title, :string
    add_column :items, :body, :string
  end
end
