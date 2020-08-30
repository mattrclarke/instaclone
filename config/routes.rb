Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "user_sessions#new"
  resource :user_sessions do
    get :new
    get :success
  end
  
  resources :users, only: [:new, :create] do
    resources :comments, only: [:create]
    resources :feed, only: [:show]
    resources :profile, only: [:show, :index, :edit, :update]
    resources :posts, only: [:create]
  end
  
end
