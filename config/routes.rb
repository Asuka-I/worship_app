Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "homes#index"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :users do
    member do
      get "worships"
      get "seals"
    end
    collection do
      get "search"
    end
  end

  resources :users, only: %i[show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :seals do
    collection do
      get "search"
    end
    resource :seal_likes, only: [:create, :destroy]
  end

  resources :worships do
    collection do
      get "search"
    end
    resources :comments, only: :create
    resource :worship_likes, only: [:create, :destroy]
  end
end
