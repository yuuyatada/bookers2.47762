Rails.application.routes.draw do
 
  get 'homes/top'
  devise_for :users
get 'homes/top'
root to: "homes#top"
resources :books, only: [:new, :index, :show]
resources :users, only: [:show, :edit]
end
