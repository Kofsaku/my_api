Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "items" => "items#index"
  get "items/:id" => "items#show"
  post "create" => "items#create"
  delete "delete/:id" => "items#destroy"
  get "search" => "items#search" 

end
  