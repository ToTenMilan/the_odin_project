Rails.application.routes.draw do

  # get 'users/new'

  # get 'users/create'

  # get 'users/show'
  root 'static_pages#home'
  # delete '/signout', to: 'user#destroy'
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
