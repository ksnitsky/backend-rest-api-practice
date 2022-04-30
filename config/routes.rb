Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :posts
        resources :users
      end
    end
  end
end
