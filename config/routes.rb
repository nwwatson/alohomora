Rails.application.routes.draw do

  resources :users
  resources :verifications, only: ["new", "create"]
  
  resources :sessions
  
  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "signup", to: "users#new", as: "signup"
    get "signin", to: "sessions#new", as: "signin"
  end
  
  
  #match 'signup' => 'sessions#new', via: :get, as: "signin"
  match 'signout' => 'sessions#destroy', via: :get, as: "signout"
  #match 'signup' => 'accounts#new', via: :get, :as "signup"
end
