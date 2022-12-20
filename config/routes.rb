Rails.application.routes.draw do
 
  devise_for :users
get 'home/top'
root to: "home#top"
get "home/about" => "home#about", as: "about"
resources :books, only: [:index, :show, :edit, :create, :destroy]
resources :users, only: [:show, :edit, :index]
end
