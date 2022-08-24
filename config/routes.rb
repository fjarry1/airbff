Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :specialties do
    resources :reservations
  end
  get "profil/:id", to: "pages#profil", as: "profil"
  get "profil/:id/reservations", to: "pages#reservationindex", as: "reservation_index"
end
