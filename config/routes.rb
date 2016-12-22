Rails.application.routes.draw do
    get 'su' => 'users#new'
    get 'home' => 'static_pages#home'
    get 'about' => 'static_pages#about'
    root 'static_pages#home'

end
