Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/tentang'
  get 'home/daftar_hibah'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
