Rails.application.routes.draw do
  namespace :api do
    namespace :v1, default: { format: 'json' } do
      resources :plants, only: [:index]
      mount_devise_token_auth_for 'User', at: 'users', skip: [:omniauth_callbacks] do
        resources :plants, only: [:create]
      end
    end
  end
end
