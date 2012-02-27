Alohomora::Engine.routes.draw do
  
  get "session/new"

  get "session/create"

  post "account/create"
  
  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    get "signup", to: "users#new", as: "signup"
    get "login", to: "sessions#new", as: "login"
  end

end
