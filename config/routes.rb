Iwarksns::Application.routes.draw do
  root 'posts#index', constraints: -> (r) { !r.session[:user_id].blank? }
  root 'welcome#index', as: :anonymous_root

  resources :users, only: [:create, :show] do
    member do
      post 'friend', to: 'users#friend'
      delete 'friend', to: 'users#unfriend'
    end
  end

  resources :posts, only: [:index, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'

  scope :api, module: 'api' do
    scope :v1, module: 'v1' do
      resources :posts, only: [:index, :create, :destroy] do
        resources :comments, only: [:create, :destroy]
      end
    end
  end
end
