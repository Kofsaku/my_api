class ItemsController < ApplicationController

     def index          
          page = 10
          items = Item.all
          author = params[:author]
          keyword = params[:keyword]
          tag_names = params[:tag]
          tags = Tag.where(name: tag_names)
          tag_ids = tags.ids

          if author.present? 
               items = items.joins(:author).where("authors.name LIKE ?", "%#{author}%" )
          end
          
         if tag_ids.present?
             items = items.where(id: ItemTag.select(:item_id)
             .where(tag_id: tag_ids)
             .group(:item_id)
             .having("COUNT(DISTINCT item_tags.tag_id) = ?", tag_ids.length))
          end
     
          if keyword.present?
               items = items.where("title LIKE ?", "%#{keyword}%" ).or (items.where("body LIKE?","%#{keyword}%"))
          end
          items = items.paginate(page: params[:page], per_page: page)
               
          awesome = []
          items.each do |item|
               hash = item.attributes 
               awesome.push(hash)
               if item.author.present?
                    hash.store("name", item.author.name)
                    hash.store("tags", item.tags)
                  #  hash.store("item_tags", item.item_tags)
               else 
                    hash.store("name", nil)
               end
          end
          render :json => awesome
     end

     def show
          item = Item.find(params[:id])
          render :json => item
     end

     def create 
          item = Item.new(title: params[:title], body: params[:body])
          if item.save then
               render :json => { result: "success", title: item.title, body: item.body}
          else
               render :json => { result:  "failed", title: item.title,  body: item.body}
          end
     end

     def update
          item = Item.find_by(id: params[:id])
          if item.update(title: params[:title], body: params[:body], author_id: params[:author_id], tag_ids: params[:tag_id]) 
               awesome_hash = item.attributes
               awesome_hash.store("name", item.author.name)
               awesome_hash.store("tags", item.tags)
               awesome_hash.store("result", "success")
               render :json => awesome_hash
          else 
               render :json => { result:  "failed", title: item.title,  body: item.body}
          end
     end

     def destroy
          item = Item.find(params[:id])
          item.destroy
          render :json => item
     end

end