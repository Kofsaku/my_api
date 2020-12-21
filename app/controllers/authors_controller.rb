class AuthorsController < ApplicationController
     def index
          authors = Author.all
          authors = Author.where("name LIKE ?", "%#{params[:name]}%" )
          render :json => authors
     end

     def show 
          author = Author.find(params[:id])
          render :json => author
     end

     def create
          author = Author.new(name: params[:name])
          if author.save then
               render :json => {result: "success", name: paramas[:name]}
          else 
               render :json => {result: "failed"}
          end
     end

     def destroy
          author = Author.destroy(params[:id])
          render :json => author
     end

     def update
          author = Author.find_by(params[:id])
          author.update(name: params[:name])
          render :json => author
     end

end
