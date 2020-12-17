class ItemsController < ApplicationController
     def index          
          @items = Item.all
         render  :json =>  @items
     end

     def show
          @item = Item.find(params[:id])
          render :json => @item
     end

     def create 
          item = Item.new(:title => "#{params[:title]}", :body => "#{params[:body]}")
         if item.save then
          render :json => { result:  "success", title: item.title,  body: item.body}
         else
          render :json => { result:  "failed", title: item.title,  body: item.body}
         end
     end
end
