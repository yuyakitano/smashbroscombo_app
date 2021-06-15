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
  end

  #いいね機能の実装①
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  #いいね機能の実装②
  #resources :likes, only: %i[create destroy]
  
  #devise実装に伴う追加
  root to:'combos#index'

  resources :follow
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
