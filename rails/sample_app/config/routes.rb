Rails.application.routes.draw do

  # get 'sessions/new'

  # syntax error, unexpected => root to: => "static_pages#home" ^
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'# , as: 'pomidor'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create' # turned of by listing 8.2
                                     # turn on by exercise 10.1.1.2
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  # get 'static_pages/help'
  # get 'static_pages/about'
  # get 'static_pages/contact'

end
