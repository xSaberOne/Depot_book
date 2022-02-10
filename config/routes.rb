# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'admin/index'
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products do
    get :who_bought, on: :member
    resources :reviews, except: [:show, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
