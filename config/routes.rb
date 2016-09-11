Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  get '/users', to: 'users#index'

  post '/reigns', to: 'users#update'

  root 'welcome#index'

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  get '/reigns', to: 'reigns#index'

  get '/:user_id/check_monarch', to: 'users#check_if_still_monarch'

  get '/out', to: 'refuse#index'

end
