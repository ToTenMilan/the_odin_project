Rails.application.routes.draw do

  # syntax error, unexpected => root to: => "static_pages#home" ^
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'

end
