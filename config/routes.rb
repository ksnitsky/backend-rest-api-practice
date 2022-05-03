Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :posts
        # resources :users
        post 'register', to: 'users#create'
        post 'login', to: 'authentication#create'
      end
    end
  end
end
