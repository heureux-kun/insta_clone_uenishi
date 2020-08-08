Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: %i[new create]
  get '/login', to: 'user_sessions#new', as: :login
  post '/login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
end
