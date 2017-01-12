Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

    root 'static_pages#home'
    get 'abt'               => 'static_pages#about'
    get 'nr'                => 'static_pages#newsroom'
    get 'h'                 => 'static_pages#help'
    get 'su'                => 'users#new'
    post 'su'               => 'users#create'
    get 'li'                => 'sessions#new'
    post 'li'               => 'sessions#create'
    delete 'lo'             => 'sessions#destroy'
    match '404', :to => 'errors#not_found', :via => :all
    match '500', :to => 'errors#internal_server_error', :via => :all
    get ':username'         => 'users#show' # Handle anything else (assume it's a user's profile)
    get ':username/edit'    => 'users#edit'
    patch ':username'       => 'users#update'
    resources :users do
        member do
            get :following, :followers
        end
    end
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]
    resources :posts,          only: [:create, :destroy]
    resources :relationships,       only: [:create, :destroy]
end
