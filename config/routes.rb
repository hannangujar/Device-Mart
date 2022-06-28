Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "pages#home"
  resources :companies
  resources :products
  resources :reviews do
    resources :products
  end
  resources :products do
    resources :reviews, only: [:create]
  end
end
