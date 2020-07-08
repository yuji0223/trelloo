Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'top#index'
  resources :list, only: [:new, :create, :edit, :update, :destroy]
end
