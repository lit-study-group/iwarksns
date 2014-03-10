IwarksnsBase::Application.routes.draw do
  root 'posts#index', constraints: -> (r) { !r.session[:user_id].blank? }
  root 'welcome#index', as: :anonymous_root

  resources :users, only: [:index, :create] do
    member do
      post 'friend', to: :friend
      delete 'friend', to: :unfriend
    end
  end
  resources :posts, only: [:index, :create, :destroy]

  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
end
