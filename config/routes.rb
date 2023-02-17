Rails.application.routes.draw do
  get "about-us", to: "about#index", as: :about
 

get "password", to:"passwords#edit", as: :edit_password
patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  
  resources :gossips
  root to: "gossips#index"

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'session'
  delete '/logout', to: 'sessions#destroy', as: 'destroy_session'
end
