Rails.application.routes.draw do
  root 'users#index'
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api do

  namespace :api do
    defaults format: :json do
      resources :users
    end
  end

  # namespace :admin do
  #   constraints subdomain: 'admin' do
  #     resources :photos
  #   end
  # end

end
