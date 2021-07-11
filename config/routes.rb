Rails
  .application
  .routes
  .draw do
    get 'rooms/index'
    devise_for :users
    resources :users do
      member do
        get 'show'
        get 'profile'
      end
    end

    get 'home/index'

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: 'home#index'

    #get 'search' => 'rooms#search'

    #get 'search1' => 'rooms#search1'
    resources :rooms do
      collection do
        get 'post' => 'rooms#post'
        get 'search' => 'rooms#search'
      end
    end

    resources :rooms
    resources :reservations do
      collection do
        post 'reservations/confirm' # 確認画面
        post 'reservations/back' # 確認画面から「入力画面に戻る」をクリックしたとき
        post 'reservations/complete'
      end
    end
  end
