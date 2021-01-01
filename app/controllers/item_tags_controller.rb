class ItemTagsController < ApplicationController
     def index
          item_tags = ItemTags.all
     end
end