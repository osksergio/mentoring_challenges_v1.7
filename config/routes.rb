Rails.application.routes.draw do
  resources :parts
  resources :assemblies
  resources :accounts
  resources :suppliers
  resources :books
  resources :authors

  # APIs routes
  #post 'authors/create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
