class Item < ApplicationRecord
     validates :title, :body, presence: true
     belongs_to :author, optional: true
     has_many :item_tags
     has_many :tags, through: :item_tags
end
