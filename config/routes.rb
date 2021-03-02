Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # blogger: new, create, show
  resources :bloggers, only: [:new, :create, :show, :index]
  # destination: show
  resources :destinations, only: [:show]
  # post: new, create, edit, update, show
  resources :posts, only: [:new, :create, :edit, :update, :show]

  patch '/post/:id/like', to: 'posts#like_it', as: 'like'
end
