Rails.application.routes.draw do
match '/admin/movies' => 'movies#create', via: :post
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

    get 'movies/detail' => 'movies#detail',as: :detail_movies

  resources :movies do
  	
  	resources :comments
end
end