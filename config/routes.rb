Rails.application.routes.draw do
  root 'items#index'
  get 'mypage', to: 'welcome#mypage'
  get 'signout', to: 'welcome#signout'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :addresses, only: [:edit, :update]

  resources :welcome, only: [:index]
  resources :purchases, only: [:index]

  resources :items do
    resources :purchases, only: [:new, :create]
    collection do
      get 'search'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :cards, only: [:show, :new, :create, :destroy]
  
end

