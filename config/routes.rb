Rails.application.routes.draw do
  get 'sessions/new'

    root 'static_pages#home'
    get 'abt' => 'static_pages#about'
    get 'nr' => 'static_pages#newsroom'
    get 'su' => 'users#new'
    post 'su',  to: 'users#create'
    get 'li', to: 'sessions#new'
    post 'li', to: 'sessions#create'
    delete 'lo', to: 'sessions#destroy'
    resources :users
end
