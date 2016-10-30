Rails.application.routes.draw do

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :numbers
  resources :participation_tokens
  resources :polls

  root to: 'polls#index'

  get 'polls/:id/participate/:participation_token', to: 'polls#participate', as: 'participitation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
