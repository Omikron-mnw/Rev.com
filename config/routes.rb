Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'devise/admins/sessions',
    passwords:     'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'devise/users/sessions',
    passwords:     'devise/users/passwords',
    registrations: 'devise/users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Admin側
  namespace :admin do
    #TopページをHomeに変更
    get '/' => 'homes#top'

    resources :comics
    resources :categories, except: [:new, :show, :destroy]
    resources :users, only: [:index, :show]

  end

  #User側
  scope module: :public do
    #Topページ
    root to: "homes#top"
    #aboutページ
    get 'homes/about' => 'homes#about'
    #user周りのルート
    resources :users, except: [:new, :create, :destroy]
    get "users/:id/unsubscribe" => "uses#unsubsucribe", as: 'user_unsubsucribe'
    patch "users/:id/withdraw" => "users#withdraw", as: 'user_withdraw'
    #フォロー機能
    resources :relationships, except: [:new, :edit, :update, :show]
    #Comicの中にルーティングする必要はないかも？
    resources :comics, only: [:index, :show]
    resources :reviews do
       resources :comments, except: [:new, :edit, :update]
       resources :likes, only: [:create, :destroy]
    end
    #Tag機能
    resources :tags, only: [:new, :create, :destroy]
    resources :tag_maps, only: [:create, :destroy]

  end

end
