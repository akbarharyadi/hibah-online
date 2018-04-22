Rails.application.routes.draw do
  resources :hibahs, :path => 'hibah'
  namespace :admin do
    resources :tentangs, :path => 'tentang', except: [:show]
    resources :peraturans, :path => 'peraturan', except: [:show]
    resources :users, except: [:show]
    resources :dinas, except: [:show]
    resources :homepages, only: [:update, :edit]
    resources :kategoris, except: [:show]
    resources :roles, only: [:index, :edit, :update]
    get 'dashboard/index'
    # proposal controller
    get 'proposal/index'
    get 'proposal/seleksi'
    # get 'users/index'

    root to: "dashboard#index"
  end

  devise_for :users #, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/index'
  get 'home/tentang'
  get 'home/daftar_hibah'
  get 'home/peraturan'
  get '/home/:id', to: 'home#show', as: 'show_hibah'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
