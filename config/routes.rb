Rails.application.routes.draw do

  resources :users
  resources :verifiactions, only: ["index", "create"]
  
  resources :sessions
  
  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "signup", to: "users#new", as: "signup"
    get "login", to: "sessions#new", as: "login"
  end
  
  
  match 'signout' => 'sessions#destroy', via: :get, as: "signout"
  #match 'signup' => 'accounts#new', via: :get, :as "signup"
end
