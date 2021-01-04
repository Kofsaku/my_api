class ItemsController < ApplicationController

     def index          
          page = 4
          items = Item.all
          author = params[:author]
          keyword = params[:keyword]
         items = Item.all

          if author.present? && keyword.blank?
           items = Item.joins(:author)
           .where("authors.name LIKE ?", "%#{author}%" ).paginate(page: params[:page], per_page: page)
          elsif author.blank? && keyword.present?
           items = Item
           .where("title LIKE ?", "%#{keyword}%" ).paginate(page: params[:page], per_page: page)
           .or (Item.where("body LIKE?","%#{keyword}%")).paginate(page: params[:page], per_page: page)
          elsif author.present? && keyword.present?
          items = Item.joins(:author)
          .where("authors.name LIKE ?", "%#{author}%" ).paginate(page: params[:page], per_page: page)
          .where("title LIKE ?", "%#{keyword}%" ).paginate(page: params[:page], per_page: page)
          .or(Item.where("authors.name LIKE ?", "%#{author}%" ).paginate(page: params[:page], per_page: page)
          .where("body LIKE ?", "%#{keyword}%" )).paginate(page: params[:page], per_page: page)
          else 
               items = Item.paginate(page: params[:page], per_page: page)
          end
       
          awesome = []
          items.each do |item|
               hash = item.attributes 
               awesome.push(hash)
               if item.author.present?
                    hash.store("name", item.author.name)
                    hash.store("tags", item.tags)
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