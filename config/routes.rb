Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :combos
    resources :comments
    resources :contacts

    
  end
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users
  resources :users do
    resource :follow
    resources :followings
    resources :followers
  end
  #, only: [:show, :index, :edit]
  
  #get '/user/:id' => 'users#show', as:'user'

  resources :combos do
    resources :commands
    resources :fighters
    resources :comments, only: [:create, :destroy]
    #投稿確認画面の実装
    post :confirm, action: :confirm_new, on: :new
    #ソート機能の実装
    collection do
      match 'search' => 'combos#search', via: [:get, :post]
    end
  end

  

  #いいね機能の実装①
  post 'like/:id' => 'likes#like', as: 'like'
  delete 'like/:id' => 'likes#unlike', as: 'unlike'

  #いいねランキング累計・週・月・年切替の実装
  #get 'combos/:name' => 'combos#index', as: 'all_like'
  #get 'combos/:name', controller: 'combos', action: 'index'
  #いいね機能の実装②



  #resources :likes, only: %i[create destroy]
  
  # post   '/like/:id' => 'likes#like',   as: 'like'
  # delete '/like/:id' => 'likes#unlike', as: 'unlike'


  #devise実装に伴う追加
  root to:'combos#index'


  resources :follow
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #お問い合わせ（contact）機能の実装
  resources :contacts, onry: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'  
  #「お問い合わせ投稿完了しました」画面が必要なら
  #get 'done', to: 'contacts#done', as: 'done'
end
