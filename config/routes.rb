Rails.application.routes.draw do

  root to: "works#top"
  get 'works/about'

  resources :works
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
