Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  devise_for :users
end 