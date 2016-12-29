Rails.application.routes.draw do
    root 'static_pages#home'
    get 'abt'               => 'static_pages#about'
    get 'nr'                => 'static_pages#newsroom'
    get 'c'                 => 'static_pages#contact'
    get 'su'                => 'users#new'
    post 'su'               => 'users#create'
    get 'li'                => 'sessions#new'
    post 'li'               => 'sessions#create'
    delete 'lo'             => 'sessions#destroy'
    get ':username'         => 'users#show' # Handle anything else (assume it's a user's profile)
    get ':username/edit'    => 'users#edit'
    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]
    resources :posts,               only: [:create, :destroy]
end
