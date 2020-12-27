class ItemsController < ApplicationController
     def index          
          items = Item.all
         author = "#{params[:author]}"
         keyword = "#{params[:keyword]}"
         if author.present? && keyword.empty?
          items = Item.left_joins(:author).where(authors: {name: "#{author}"})
         elsif author.empty? && keyword.present?
          items = Item.where("title LIKE ?", "%#{keyword}%" ).or (Item.where("body LIKE?","%#{keyword}%"))
         elsif author.present? && keyword.present?
         items = Item.joins(:author).where("authors.name LIKE ?", "%#{author}%" ).where("title LIKE ?", "%#{keyword}%" )
         end

               #items = Item.left_joins(:author).where("name LIKE?", "%#{params[:keyword]}%").present?
          #else items = Item.all
          #end
          awesome = []
          items.each do |item|
               hash = item.attributes 
               awesome.push(hash)
               if item.author.present?
                    hash.store("name", item.author.name)
               else 
                    hash.store("name", nil)
               end
          end
          render :json => awesome
     end
    # items.to_json(:include => :author)

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
          if item.update(title: params[:title], body: params[:body], author_id: params[:author_id]) 
               awesome_hash = item.attributes
               awesome_hash.store("name", item.author.name)
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