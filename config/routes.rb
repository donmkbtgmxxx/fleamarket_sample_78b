Rails.application.routes.draw do
  root 'welcome#index'
  resources :items
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'welcome#index'
  resources :items, only: [:index, :new]
  
end
