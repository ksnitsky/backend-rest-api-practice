Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :posts, only: %i[index create show destroy]

        put 'posts/:id', to: 'posts#update'
        patch 'posts/:id', to: 'posts#patch'

        post 'posts/:post_id/commentary/', to: 'commentary#create'
        delete 'commentary/:id', to: 'commentary#destroy'
        patch 'commentary/:id', to: 'commentary#update'

        get 'users/:id', to: 'users#show'
        post 'register', to: 'users#create'
        post 'login', to: 'authentication#create'
      end
    end
  end
end
