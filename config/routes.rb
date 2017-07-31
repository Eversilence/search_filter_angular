Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :products, only: :index do
      get 'search', on: :collection
    end

    resources :properties, only: [:index]
  end

  root to: 'application#angular'
end
