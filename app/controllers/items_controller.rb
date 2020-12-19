class ItemsController < ApplicationController
     def index          
          items = Item.all
          items = Item.where("title LIKE ?", "%#{params[:keyword]}%" ).or (Item.where("body LIKE?","%#{params[:keyword]}%"))
         render  :json =>  items
     end

     def show
          @item = Item.find(params[:id])
          render :json => @item
     end

     def create 
          item = Item.new(title: params[:title], body: params[:body])
         if item.save then
          render :json => { result:  "success", title: item.title,  body: item.body}
         else
          render :json => { result:  "failed", title: item.title,  body: item.body}
         end
     end


     def update
          item = Item.find_by(id: params[:id])
          item.update(title: params[:title], body: params[:body])
          item.save
          render :ison => item

     def destroy
          item = Item.find(params[:id])
          item.destroy
          render :json => item
     end
end

#リクエストはtitile とbody以外も入れれるようにする。
#なんでもいいから入力されたやつがtitleかbodyに含まれているのかを確認してjsonで返す。
#          item = Item.where(:title => "#{params[:title]}", :body => "#{params[:body]}")
#クエリ　SQL 複数のモデルにあるデータないで検索することもある

#updateを作る　指定された🆔のtitleやbodyを更新できるAPIを作る。
