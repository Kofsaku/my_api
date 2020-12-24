class ItemsController < ApplicationController
     def index          
          @item = Item.all
          items = Item.where("title LIKE ?", "%#{params[:keyword]}%" ).or (Item.where("body LIKE?","%#{params[:keyword]}%"))
         render  :json =>  items
     end

     def show
          item = Item.find(params[:id])
          render :json => item
     end

     def create 
          item = Item.new(title: params[:title], body: params[:body], )
         if item.save then
          render :json => { name: params[:name]}
         else
          render :json => { result:  "failed", title: item.title,  body: item.body}
         end
     end


     def update
          #アップデートしたいitemsのデータをidから取得
          #authorの
          #のnameを含めてupdateする
          #アップデートしたデータのjsonで返す。
          item = Item.find_by(id: params[:id])

          if item.update(title: params[:title], body: params[:body], author_id: params[:author_id]) 
          #author = Author.find(3)
          #item = Item.find(4)
          #item.update(title: item.title, body: item.body, author_id: @author.name)
          awesome_hash = item.attributes
          awesome_hash.store("name", item.author.name)
          awesome_hash.store("result", "success")
          render :json => awesome_hash
          else 
          render :json => { result:  "failed", title: item.title,  body: item.body}

          #render :json => item.to_json(methods: [:author])
          #https://qiita.com/eggc/items/29a3c9a41d77227fb10a

          #{title: item.title, body: item.body, name: item.author.name}
          end
     end

     def awesome_attributes
          return {}
     end

     def destroy
          item = Item.find(params[:id])
          item.destroy
          render :json => item
     end
end


#別々のモデルを関連づけれられるように
#authorからtitle、body
#index itemsでtitleとbodyが入るがここにauthorも含める。
#item updateをする時にauthorのidを指定するとtitle、bodyにauthorも追加される。
#has many has one ActiveRecord
#relation