Rails.application.routes.draw do
    
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  get "search" => "searches#search"
  
  resources :plants, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]  
    resources :plant_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end