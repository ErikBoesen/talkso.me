Rails.application.routes.draw do
    root 'static_pages#home'
    get 'home' => 'static_pages#home'
    get 'about' => 'static_pages#about'
    get 'su' => 'users#new'
    post 'su',  to: 'users#create'
    resources :users
end
