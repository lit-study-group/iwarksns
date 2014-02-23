Iwarksns::Application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:create, :show]
  resources :posts, only: [:index, :create, :destroy]

  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
end
