Rails.application.routes.draw do



  # get 'sessions/new'
  # post 'sessions/create'
  # delete 'sessions/destroy'
  root 'static_pages#home'
  get 'forum', to: 'static_pages#forum'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
