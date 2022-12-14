Rails.application.routes.draw do
  resources :photos, only: %i[create show new destroy]
  devise_for :users
  delete "users/:id", to: "users#destroy"
  resources :users, only: %i[show]
  resources :tweets, except: %i[edit update] do
    resources :comments, only: %i{create}
    member do
      post :retweet
    end
  end
  resources :likes, only: %i[create destroy]
  
  get 'home', to: "home#home"
  root "tweets#index"
 end
