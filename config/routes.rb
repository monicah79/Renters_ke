Rails.application.routes.draw do
  root to: "home#index"
  get '/error', to: 'errors#error_404', as: :error
  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show] 
    resources :comment, only: [:new, :create]
    get 'post', on: :member
  
  end
end
