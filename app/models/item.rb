class Item < ApplicationRecord
     validates :title, :body, presence: true
end
