Rails.application.routes.draw do
  devise_for :users

  get 'users/new'

  get 'users/create'

  get 'users/show'

  resources :collaborators, only: [:create, :destroy]

  resources :users, only: [:show]

  resources :wikis

  resources :charges, only: [:new, :create]
  get "downgrade", to: "charges#downgrade"

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
