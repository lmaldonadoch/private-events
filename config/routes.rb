Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "events#index"

  resources :users
  get '/sign_in', to: 'users#sign_in_form'
  post '/sign_in', to: 'users#sign_in'
  get '/sign_out', to: 'users#sign_out'

  resources :events, only: [:new,:create,:show,:index]
end
