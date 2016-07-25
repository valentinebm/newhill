Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  root 'welcome#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  get '/reigns', to: 'reigns#index'


end
