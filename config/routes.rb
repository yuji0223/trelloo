Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'top#index'

  resources :lists, only: [:new, :create, :edit, :update, :destroy] do
    resources :cards, except: :index do
      put :sort
    end
  end

  resources :wants, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :details, except: :index do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: :create
      put :sort
    end
  end
end
