Rails.application.routes.draw do
  
  resources :articles

  resources :blogs

  root :to => 'welcome#index'
end
