Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "user#index"
  resources :user, only: [:index, :show] do
    resources :post, only: [:index, :show] 
    resources :comment, only: [:new, :create]
  end
  devise_scope :user do
    post 'users/sign_up', to: 'users/registrations#create'
  end
end
