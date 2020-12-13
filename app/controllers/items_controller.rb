class ItemsController < ApplicationController
     def index          
          render  :json => { title: "英語を効率的に学ぶための10の秘訣", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." }
     end
end
#itemというモデルを作る。モデルのデータを複数個作ってみて。その複数を配列のjsonとして、返す。
#↓
#API経由で不要なデータをCRUDできるようにする。