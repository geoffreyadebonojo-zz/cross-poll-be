Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      resources :sessions
      resources :locations
      resources :favorites
      resources :texts, only: :create
      delete '/favorites', to: 'favorites#destroy'
      post '/shelter_notifier', to: 'shelter_notifier#create'
      get '/distances', to: 'distances#index'
    end
  end

end
