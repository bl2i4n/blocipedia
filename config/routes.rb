Rails.application.routes.draw do

  get 'users/new'

  get 'users/create'

  get 'users/show'

  resources :wikis

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  devise_for :users

end
