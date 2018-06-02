Rails.application.routes.draw do
  resource :access, only: [:show, :create]
  resource :new_account, only: [:show, :create]
  resource :session, only: [:show, :destroy]
end
