Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :members

  root to: "member/works#top"
  get "works/about" => 'member/works#about'

  namespace :admin do
  	resources :genres, only: [:index,:edit,:update,:create,:destroy]
    resources :members, only: [:index,:show,:edit,:update]
  end

    resources :works, only: [:index, :show] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :members do
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
      scope module: :member do
        resources :works do
          resource :favorites, only: [:create, :destroy]
        end
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
