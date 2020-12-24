class ItemsController < ApplicationController
     def index          
          item = Item.all
          items = Item.where("title LIKE ?", "%#{params[:keyword]}%" ).or (Item.where("body LIKE?","%#{params[:keyword]}%"))
          render  :json =>  items
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