Rails.application.routes.draw do
  get '/error', to: 'errors#error_404', as: :error
  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show] 
    resources :comment, only: [:new, :create]
  
  end
end
