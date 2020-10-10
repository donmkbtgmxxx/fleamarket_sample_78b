Rails.application.routes.draw do
  root 'items#index'
  get 'mypage', to: 'welcome#mypage'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :items do
    get 'confirmation', to: 'purchases#confirm'
    post 'purchase', to: 'purchases#purchase'
    collection do
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
