class ItemsController < ApplicationController
     def index          
          @items = Item.all
          #items2 = Item.create(:title => "英語を使えるようになる1万の秘密", :body => "what you need to do first is to remember more than 100,000 words in a day.")
         render  :json =>  @items

     end
end

#別のdefを作る。
#↑とは別にidごとにjsonを返すアクションの設定 @items = Item.find(params[:id])
#特定の情報をとってくる
#新しく作る
#あるデータを削除するAPI
#cd ../
#ls 
# 