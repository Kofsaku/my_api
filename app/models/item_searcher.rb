class ItemSearcher 
     def initialize(params, items, keyword, tags_name)
          @params = params
          @items = items
          @keyword = keyword
          @tags_name = tags_name
     end

     def execute
          
          tags_list = Tag.where(name: @tags_name)
          tag_ids = tags_list.ids

          if @params[:author].present? 
               @items = @items.joins(:author).where("authors.name LIKE ?", "%#{@params[:author]}%")
          end

          if @params[:keyword].present?
               @items = @items.where("title LIKE ?", "%#{@params[:keyword]}%" ).or (@items.where("body LIKE?","%#{@params[:keyword]}%"))
          end

          if tag_ids.present?
               @items = @items.where(id: ItemTag.select(:item_id)
               .where(tag_id: tag_ids)
               .group(:item_id)
               .having("COUNT(DISTINCT item_tags.tag_id) = ?", tag_ids.length))
          end
          return @items
     end
end

#params = ActionController::Parameters.new({author: "織田信長" })

params = ActionController::Parameters.new(author: "", keyword: "プログラム")

item_searcher1 = ItemSearcher.new(params, Item.all,"","")
item_searcher2 = ItemSearcher.new(params, Item.all, "", "モテテクニック")
item_searcher3 = ItemSearcher.new(params, Item.all, "織田", "", ["歴史","英語"])
item_searcher4 = ItemSearcher.new(params, Item.all, "", "", ["歴史", "ミステリー"])
item_searcher5 = ItemSearcher.new(params, Item.all, "", "プログラム", "")
item_searcher6 = ItemSearcher.new(params, Item.all, "", "信長", "歴史")
item_searcher7 = ItemSearcher.new(params, Item.all, "", "", "")
item_searcher7 = ItemSearcher.new(params, Item.all, "津端", "英語", "")
if item_searcher1.execute.count != 3
     raise "アウト"
end
if item_searcher2.execute.count != 3
     raise "アウト"
end
if item_searcher3.execute.count != 1
     raise "アウト"
end
if item_searcher4.execute.count != 3
     raise "アウト"
end
if item_searcher5.execute.count != 1 
     raise "アウト"
end
if item_searcher6.execute.count != 2
     raise "アウト"
end
if item_searcher7.execute.count != 2
     raise "アウト"
end



