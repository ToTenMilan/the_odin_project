Rails.application.routes.draw do

  root 'static_pages#home'
  # delete '/signout', to: 'user#destroy'
  resources :users, only: [:new, :create, :show, :destroy] # because of no SesionsController, destroy route is actually just signing user out (clear session hash)
  resources :events, only: [:new, :create, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
