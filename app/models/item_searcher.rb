class ItemSearcher 
     def initialize(params, items)
          @params = params
          @items = items
     end

     def execute
          if @params[:author].present? 
               @items = @items.joins(:author).where("authors.name LIKE ?", "%#{@params[:author]}%")
          end

          if @params[:keyword].present?
               @items = @items.where("title LIKE ?", "%#{@params[:keyword]}%" ).or (@items.where("body LIKE?","%#{@params[:keyword]}%"))
          end

          tags_list = Tag.where(name: @params[:tag_names])
          tag_ids = tags_list.ids
          if tag_ids.present?
               @items = @items.where(id: ItemTag.select(:item_id)
               .where(tag_id: tag_ids)
               .group(:item_id)
               .having("COUNT(DISTINCT item_tags.tag_id) = ?", tag_ids.length))
          end
          return @items
     end
end