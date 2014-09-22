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

  scope '/api' do
    get '(:country)/campaigns/(:status)', to: 'campaigns#api_index'
   # get 'campaigns', to: 'campaigns#index'
   # get 'campaigns/active', to: 'campaigns#index'
   # get ':country/campaigns/', to: 'campaigns#index'
   # get ':country/campaigns/active', to: 'campaigns#index'
  end

  root 'advertisers#index'
end
