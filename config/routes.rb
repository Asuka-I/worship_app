Rails.application.routes.draw do
  root "homes#index"
  devise_for :users
  resource :users, only: :show
  resources :worships do
    resources :comments, only: :create
  end
end