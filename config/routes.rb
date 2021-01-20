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

    get "comics/:isbn" => "comics#show", as: 'comic'
    get "comics/:isbn/edit" => "comics#edit", as: 'comic_edit'
    patch "comics/:isbn" => "comics#update", as: 'comic_update'
    delete "comics/:isbn/destroy" => "comics#destroy", as: 'comic_destroy'
    get "search/comics" => "comics#search", as: 'comics_search'
    resources :comics, only: [:index, :create]

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
    get "users/:id/unsubscribe" => "users#unsubscribe", as: 'user_unsubscribe'
    patch "users/:id/withdraw" => "users#withdraw", as: 'user_withdraw'
    #フォロー機能
    resources :relationships, only: [:create, :destroy]
    get "relationships/follows" => "relationships#follow", as: 'relationships_follows'
    get "relationships/followers" => "relationships#follower", as: 'relationships_followers'
    #Comic関連のルーティング
    get "comics/:isbn" => "comics#show", as: 'comic'
    resources :comics, only: [:index] do
      #レビュー機能
      resources :reviews do
         resources :comments, only: [:create, :destroy]
         resource :likes, only: [:create, :destroy]
      end
      #Tag機能
      resources :tags, only: [:create, :destroy] do
        get 'search', to: 'tag#search'
      end
    end
  end

end
