Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :posts, not: [:update]
        resources :commentary

        put 'posts/:id', to: 'posts#update'
        patch 'posts/:id', to: 'posts#patch'

        get 'users/:id', to: 'users#show'
        post 'register', to: 'users#create'
        post 'login', to: 'authentication#create'
      end
    end
  end
end
