Rails.application.routes.draw do
  post 'reviews' => 'reviews#create'
  get 'products' => 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
