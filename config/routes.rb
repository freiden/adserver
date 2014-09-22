Rails.application.routes.draw do
  devise_for :users

  resources :advertisers do
    resources :campaigns
  end

  resources :campaigns

  resources :users, :except => :show do
    resources :advertisers do
      resources :campaigns
    end
  end

  namespace :api, module: false do
    get 'campaigns'
    get 'campaigns/active'
    get ':country/campaigns/'
    get ':country/campaigns/active'
  end

  root 'advertisers#index'
end
