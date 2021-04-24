Rails.application.routes.draw do
  resources :answers,only:[:create]

  namespace :admin do
    resources :questions,only:[:index,:destroy]
  end
  
  namespace :admin do
    get "/login",to:"sessions#new"
    post "/login",to:"sessions#create"
    delete "/logout",to:"sessions#destroy"
  end
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :users,only:[:index,:new,:create]
  
  namespace :admin do
    resources :users,only:[:index, :destroy]
  end
  
  root to:'questions#index'
  resources :questions

end
