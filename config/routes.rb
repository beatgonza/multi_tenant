MultiTenant::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  resources :home, only: [:index]

  root :to => 'home#index'

end
