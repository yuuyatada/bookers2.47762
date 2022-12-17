Rails.application.routes.draw do
 
  get 'homes/top'
  devise_for :users
get 'homes/top'
root to: "homes#top"
end
