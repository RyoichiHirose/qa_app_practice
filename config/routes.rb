Rails.application.routes.draw do
  resources :answers,only:[:create]
  
  get "/questions/:id/solved"=>"questions#change_solved"
  get "/questions/:id/unsolved"=>"questions#change_unsolved" 
  
  get "/questions/solved" =>"questions#solved"
  get "/questions/unsolved"=>"questions#unsolved"

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
