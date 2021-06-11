Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users
  resources :users
  #, only: [:show, :index, :edit]
  
  #get '/user/:id' => 'users#show', as:'user'

  resources :combos do
    resources :commands
    resources :comments, only: [:create, :destroy]
  end
  post '/like/:combo_id' => 'likes#like', as: 'like'
  delete '/like/:combo_id' => 'likes#unlike', as: 'unlike'

  root to:'combos#index'

  resources :follow
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
