PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/profile', to: 'users#show'

  resources :posts, except: :destroy do
    member do
      post :vote
    end
    resources :comments, only: [:create] do
      member do
        post :vote
      end
    end
  end
  resources :categories, only: [:create, :new, :show]
  resources :users, except: [:show, :destroy]
end
