Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: :create do
      end
      resources :sessions do
      end
      resources :locations do
      end
      resources :favorites do
      end
      delete '/favorites', to: 'favorites#destroy'
    end
  end

  post '/shelter_notifier', to: 'shelter_notifier#create'
end
