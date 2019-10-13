Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#artistas'

  get '/admin', to: 'admin/encuentros#index', as: :admin

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'artistas', to: 'home#artistas'
  get 'artistas/:id', to: 'home#artista', as: :artista
  get 'actividades', to: 'home#actividades'
  get 'conciertos', to: 'home#conciertos'
  get 'galeria', to: 'home#galeria'

  get 'vision', to: 'home#vision'
  get 'mision', to: 'home#mision'

  namespace :admin do
    resources :users, only: [:edit, :update]
    resources :artistas
    resources :presentaciones, only: [:destroy]

    resources :encuentros do
      resources :presentaciones, only: [:index, :create]
      resources :fotos, only: [:index]
      resources :config, only: [:index]
    end
  end
end
