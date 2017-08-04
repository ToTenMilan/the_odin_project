Rails.application.routes.draw do

  # get 'sessions/new'

  # get 'sessions/destroy'

  root 'static_pages#home'
  # delete '/signout', to: 'user#destroy'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
