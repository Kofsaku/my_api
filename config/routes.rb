Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "items" => "items#index"
  delete "items/:id" => "items#destroy"
  get "items/:id" => "items#show"
  post "create" => "items#create"
  put "update" => "items#update"
  delete "delete/:id" => "items#destroy"

end
  