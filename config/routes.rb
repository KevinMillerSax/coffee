Rails.application.routes.draw do

  root               'static_pages#home'
  get 'about'     => 'static_pages#about'
  get 'resources' => 'static_pages#resources'
  get 'signup'    => 'users#new'
end
