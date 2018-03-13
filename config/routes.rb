Rails.application.routes.draw do
  resources :hibahs, :path => 'hibah'
  namespace :admin do
    resources :users, except: [:show]
    resources :dinas, except: [:show]
    resources :kategoris, except: [:show]
    resources :roles, only: [:index, :edit, :update]
    get 'dashboard/index'
    # get 'users/index'

    root to: "dashboard#index"
  end

  devise_for :users #, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/index'
  get 'home/tentang'
  get 'home/daftar_hibah'
  get '/home/:id', to: 'home#show', as: 'show_hibah'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
