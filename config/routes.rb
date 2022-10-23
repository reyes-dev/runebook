Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users do 
    resources :friend_requests, only: [:create, :destroy, :index]
  end
  resources :posts do
    resources :comments
  end
  resources :friendships, only: [:create, :destroy]
end 