Rails.application.routes.draw do

  resources :wikis

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  devise_for :users

end
