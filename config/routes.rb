Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :members
  root to: "works#top"
  get 'works/about'

  namespace :admin do
  	resources :genres, only: [:index,:edit,:update,:create,:destroy]
  end

  resources :works
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
