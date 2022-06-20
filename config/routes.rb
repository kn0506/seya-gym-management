Rails.application.routes.draw do

  root to: "users#new"
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'signup' => 'users#new'
  get 'weight' => 'users#index'
  resources :users

end
