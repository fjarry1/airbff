Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :specialties
  # resources :reservation

  get "profil", to: "pages#profil"
end
