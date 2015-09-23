Rails.application.routes.draw do
  root to: "home#index"
  
  match '/auth/:provider/callback' => 'auth#oauth_callback', via: [:get]
  post '/logout' => 'auth#logout'


  resources :employees, only: [:new, :create, :index, :edit, :update]
  resources :scheduled_messages, only: [:new, :create, :index, :edit, :update]
end
