Rails.application.routes.draw do

  root "static_pages#home"
  get "home" => "static_pages#home"
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users do
    member do
      get "/:path", to: "relationships#index", as: "follow"
    end
  end
  resources :users, only: [:show, :index]
  resources :books, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :relationships, only: [:create, :destroy]
  resources :reviews
  resources :book_requests
  namespace :admin do
    resources :categories
    resources :users
    resources :books
    resources :book_requests
  end
end
