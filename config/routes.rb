Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users do 
    resources :friend_requests, only: [:create, :destroy, :index]
  end
  
  resources :posts do
    resources :comments
  end
  
  resources :friendships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :profiles, only: [:edit, :update]
end 