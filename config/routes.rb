Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
  resources :user, only: :new
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create]
  end
end
