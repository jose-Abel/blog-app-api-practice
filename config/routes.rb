Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [] do
      resources :posts, only: %i[index], controller: 'users/posts' do
        resources :comments, only: %i[index], controller: 'posts/comments'
      end
    end
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
