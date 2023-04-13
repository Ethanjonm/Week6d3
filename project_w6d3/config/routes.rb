Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :destroy, :index, :show, :update]

  resources :artworks, only: [:create, :destroy, :show, :update]

  resources :artworkshares, only: [:create, :destroy, :index] 

  resources :users do
    resources :artworks, only: [:index] 
  end 
  resources :users do 
    resources :comments, only: [:create, :destroy, :index]
  end 

  resources :artworks do 
    resources :comments, only: [:index]
  end
end
