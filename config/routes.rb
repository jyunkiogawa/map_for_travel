Rails.application.routes.draw do
  get 'sessions/new'
  
  get 'users/new'
  put 'users/edit'
  get 'users/edit'
  
  get 'pages/index'
  root 'pages#index'
  
  get 'kinds/index'
  
  resources :shops
  # get 'shops/index'
  # get 'shops/new'
  # post "shops"
  # get 'shops/:id'
  
  resources :shops do 
    resources :comments, only: [:create, :destroy]
  end

  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end
