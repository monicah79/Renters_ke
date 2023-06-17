Rails.application.routes.draw do
  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show] 
  
      resources :comment, only: [:new, :create]
  
  end
end
