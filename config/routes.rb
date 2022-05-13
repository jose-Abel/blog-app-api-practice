Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  
  get "friends_list", to: "friendships#friends_list"

  get "pending_requests", to: "friendships#pending_requests"

  get "friends_requests", to: "friendships#friends_requests"

  resources :friendships

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  namespace :api do
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
    resources :users, only: [] do
      resources :posts, only: %i[index], controller: 'users/posts' do
        resources :comments, only: %i[index create], controller: 'users/posts/comments'
      end
    end
  end
end
