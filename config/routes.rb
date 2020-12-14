Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "items" => "items#index"
end
 
#idごとのデータを返すようにする。index/id1みたいな
#  get "items/:id" => "items#index"