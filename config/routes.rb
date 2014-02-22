Iwarksns::Application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:create]
  resources :posts, only: [:index, :create, :destroy]
end
