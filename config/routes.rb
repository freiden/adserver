Rails.application.routes.draw do
  resources :campaigns

  devise_for :users

  resources :advertisers
  resources :users

  root 'advertisers#index'
end
