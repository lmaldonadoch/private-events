Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new,:create,:show,:index]
  get '/signup', to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'
end
