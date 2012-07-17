Alohomora::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, controller: "alohomora/api/v1/sessions", only: [:create]
      resources :registrations, controller: "alohomora/api/v1/registrations", only: [:create]
      resources :organizations do
        resources :users, controller: "alohomora/api/v1/users"
      end      
       match "/sessions/destroy", to: "sessions#destroy", via: :get
    end
  end
  
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