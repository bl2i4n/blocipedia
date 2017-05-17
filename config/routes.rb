Rails.application.routes.draw do
  devise_for :users

  get 'users/new'

  get 'users/create'

  get 'users/show'

  resources :users, only: [:show]

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  resources :charges, only: [:new, :create]
  get "downgrade", to: "charges#downgrade"

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
