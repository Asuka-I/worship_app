Rails.application.routes.draw do
  root "homes#index"

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  resources :seals do
    resource :seal_likes, only: [:create, :destroy]
  end
  
  resources :worships do
    resources :comments, only: :create
    resource :worship_likes, only: [:create, :destroy]
  end
end
