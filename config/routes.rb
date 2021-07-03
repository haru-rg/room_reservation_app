Rails
  .application
  .routes
  .draw do
    get 'rooms/index'
    devise_for :users
    get 'home/index'

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: 'home#index'
    resources :rooms
    get 'search' => 'rooms#search'
  end
