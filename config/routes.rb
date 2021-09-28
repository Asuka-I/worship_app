Rails.application.routes.draw do
  root "homes#index"
  devise_for :users
  resource :users, only: :show
  resources :seals do
    resource :seal_likes, only: [:create, :destroy]
  end
  resources :worships do
    resources :comments, only: :create
    resource :worship_likes, only: [:create, :destroy]
  end
end
