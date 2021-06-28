Rails.application.routes.draw do
  namespace :admin do
    resources :users
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
    resources :comments, only: [:create, :destroy]
    #投稿確認画面の実装
    post :confirm, action: :confirm_new, on: :new
  end

  #いいね機能の実装①
  post 'like/:id' => 'likes#like', as: 'like'
  delete 'like/:id' => 'likes#unlike', as: 'unlike'

  #いいね機能の実装②
  #resources :likes, only: %i[create destroy]
  
  # post   '/like/:id' => 'likes#like',   as: 'like'
  # delete '/like/:id' => 'likes#unlike', as: 'unlike'


  #devise実装に伴う追加
  root to:'combos#index'


  resources :follow
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
