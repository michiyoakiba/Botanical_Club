Rails.application.routes.draw do
 
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  devise_for :users
  
  resources :plants, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]  
    resources :plant_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
