Rails.application.routes.draw do
  root 'posts#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :posts do
    resources :comments, shallow: true
    resources :likes, shallow: true, only: %i[create destroy]
  end
end
