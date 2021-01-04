Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
  resources :authors
  resources :tags
#get "items" => "items#index"
 #get "items/:id" => "items#show"
 #post "create" => "items#create"
 #put "items" => "items#update"
 #delete "items" => "items#destroy"
  end

