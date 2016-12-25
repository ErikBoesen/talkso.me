Rails.application.routes.draw do
  get 'sessions/new'

    root 'static_pages#home'
    get 'home' => 'static_pages#home'
    get 'about' => 'static_pages#about'
    get 'su' => 'users#new'
    post 'su',  to: 'users#create'
    get '/li', to: 'sessions#new'
    post '/li', to: 'sessions#create'
    delete '/lo', to: 'sessions#destroy'
    resources :users
end
