class Item < ApplicationRecord
     validates :title, :body, presence: true
     belongs_to :author

end
