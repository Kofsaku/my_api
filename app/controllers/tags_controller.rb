class TagsController < ApplicationController
     def index
          tags = Tag.all
          render :json => tags
     end

     def show
          tag = Tag.find(params[:id])
          render :json => tag
     end


     def create
          tag = Tag.new(name: params[:name])
          if tag.save
          render :json => tag
          else 
               render :json => {result: failed}
          end
     end

     def update
          tag = Tag.find_by(id: params[:id])
          tag.update(name: params[:name], item_id: params[:item_id])
          render :json => tag
     end

     def destroy
          tag = Tag.find(id: params[:id])
          tag.destroy
          render :json => tag
     end


end
