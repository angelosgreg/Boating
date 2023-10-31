Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :boats do
    resources :bookings, only:[:new,:create]
  end
  resources :skippers do
    resources :reservations, only:[:new,:create]
  end
  resources :bookings ,only: [:edit,:destroy,:update,:index]
  resources :reservations,only: [:edit,:destroy,:update,:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
