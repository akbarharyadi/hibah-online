Rails.application.routes.draw do
  resources :hibahs, :path => 'hibah'
  namespace :admin do
    resources :users
    get 'dashboard/index'

    root to: "dashboard#index"
  end

  devise_for :users
  get 'home/index'
  get 'home/tentang'
  get 'home/daftar_hibah'
  get '/home/:id', to: 'home#show', as: 'show_hibah'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
