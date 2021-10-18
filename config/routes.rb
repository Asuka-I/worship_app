Rails.application.routes.draw do
  root "homes#index"

  devise_for :users
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :users, only: %i[show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :seals do
    resource :seal_likes, only: [:create, :destroy]
  end

  resources :worships do
    resources :comments, only: :create
    resource :worship_likes, only: [:create, :destroy]
  end
end
