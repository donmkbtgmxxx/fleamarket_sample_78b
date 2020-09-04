Rails.application.routes.draw do
  get 'welcome/index'
  root 'items#index'
end
