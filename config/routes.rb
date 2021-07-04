Rails
  .application
  .routes
  .draw do
    get 'rooms/index'
    devise_for :users
    resources :users, only: [:show]

    get 'home/index'

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: 'home#index'
    get 'search' => 'rooms#search'
    resources :rooms do
      collection { get 'post' => 'rooms#post' }
    end
  end
