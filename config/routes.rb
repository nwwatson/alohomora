Alohomora::Engine.routes.draw do
  resources :users
  resources :verifications, only: ["new", "create"]
  
  resources :sessions
  
  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "signup", to: "users#new", as: "signup"
    get "signin", to: "sessions#new", as: "signin"
  end
  
  match 'signout' => 'sessions#destroy', via: :get, as: "signout"
  match 'registration_complete' => "users#complete", via: :get, as: "registration_complete"
end