Rails.application.routes.draw do
  root "homes#index"
  devise_for :users
  resources :worships
  resource :users, only: :show
end
