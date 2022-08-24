Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :specialties do
    resources :reservation
  end
  get "profil/:id", to: "pages#profil", as: "profil"
end
