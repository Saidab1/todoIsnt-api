Rails.application.routes.draw do
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  post 'signup', to: 'users#create'
  resources :tasks
  resources :projects, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
