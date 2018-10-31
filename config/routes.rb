Rails.application.routes.draw do
  resources :hibahs, :path => 'hibah'
  namespace :admin do
    resources :kuncis, only: [:update, :edit]
    resources :tentangs, :path => 'tentang', except: [:show]
    resources :peraturans, :path => 'peraturan', except: [:show]
    resources :users, except: [:show] do
      collection do
        post 'set_active'
      end
    end
    resources :dinas, except: [:show]
    resources :homepages, only: [:update, :edit]
    resources :kategoris, except: [:show]
    resources :roles, only: [:index, :edit, :update]
    get 'dashboard/index'
    # proposal controller
    get 'proposal/index'
    get 'proposal/seleksi'
    get "proposal/proses_seleksi/:id" => "proposal#proses_seleksi", as: :proses_seleksi
    post "proposal/simpan_seleksi" => "proposal#simpan_seleksi", as: :simpan_seleksi
    patch "proposal/simpan_seleksi" => "proposal#simpan_seleksi"

    get 'proposal/disposisi'
    get "proposal/proses_disposisi/:id" => "proposal#proses_disposisi", as: :proses_disposisi
    post "proposal/simpan_disposisi" => "proposal#simpan_disposisi", as: :simpan_disposisi
    patch "proposal/simpan_disposisi" => "proposal#simpan_disposisi"

    get 'proposal/distribusi'
    get "proposal/proses_distribusi/:id" => "proposal#proses_distribusi", as: :proses_distribusi
    post "proposal/simpan_distribusi" => "proposal#simpan_distribusi", as: :simpan_distribusi
    patch "proposal/simpan_distribusi" => "proposal#simpan_distribusi"

    get 'proposal/evaluasi'
    get "proposal/proses_evaluasi/:id" => "proposal#proses_evaluasi", as: :proses_evaluasi
    post "proposal/simpan_evaluasi" => "proposal#simpan_evaluasi", as: :simpan_evaluasi
    patch "proposal/simpan_evaluasi" => "proposal#simpan_evaluasi"
    
    get 'proposal/pertimbangan'
    get "proposal/proses_pertimbangan/:id" => "proposal#proses_pertimbangan", as: :proses_pertimbangan
    post "proposal/simpan_pertimbangan" => "proposal#simpan_pertimbangan", as: :simpan_pertimbangan
    patch "proposal/simpan_pertimbangan" => "proposal#simpan_pertimbangan"
    
    get 'proposal/penetapan'
    get "proposal/proses_penetapan/:id" => "proposal#proses_penetapan", as: :proses_penetapan
    post "proposal/simpan_penetapan" => "proposal#simpan_penetapan", as: :simpan_penetapan
    patch "proposal/simpan_penetapan" => "proposal#simpan_penetapan"

    get 'pelaporans/report_hibah' => "pelaporans#report_hibah", as: :list_hibah
    get 'pelaporans/report_hibah_penetapan' => "pelaporans#report_penetapan", as: :list_hibah_penetapan

    get '/error', :to => redirect('/error.html')
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
