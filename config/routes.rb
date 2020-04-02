Rails.application.routes.draw do
  root                   'static_pages#home'
  get 'about'         => 'static_pages#about'
  get 'resources'     => 'static_pages#resources'
  get 'signup'        => 'users#new'
  resources :users
  get 'login'         => 'sessions#new'
  post 'login'        => 'sessions#create'
  delete 'logout'     => 'sessions#destroy'
  resources :conversations
  get 'newthread'     => 'conversations#new'
  resources :replies, only: [:create, :destroy] do
    resources  :likes
  end
end
