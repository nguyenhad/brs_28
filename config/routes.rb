Rails.application.routes.draw do

  root "static_pages#home"
  get "home" => "static_pages#home"
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"

  devise_for :users
  resources :users, only: [:show, :index]
  resources :books, only: [:show, :index]
  namespace :admin do
    resources :categories
    resources :users
  end
end
