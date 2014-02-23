Iwarksns::Application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:create, :show]
  resources :posts, only: [:index, :create, :destroy]
  resources :sessions, only: [:create, :destroy]
end
