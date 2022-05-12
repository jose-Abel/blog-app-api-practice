Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [] do
      resources :posts, only: %i[index], controller: 'users/posts' do
        resources :comments, only: %i[index], controller: 'posts/comments'
      end
    end
  end
end
