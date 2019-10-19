Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#artistas'

  get '/admin', to: 'admin/encuentros#index', as: :admin

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :password_resets, only: %i[new create edit update]

  get 'artistas', to: 'home#artistas'
  get 'artistas/:id', to: 'home#artista', as: :artista
  get 'actividades', to: 'home#actividades'
  get 'conciertos', to: 'home#conciertos'
  get 'galeria', to: 'home#galeria'

  get 'vision', to: 'home#vision'
  get 'mision', to: 'home#mision'

  get 'artistas/:id/nombre', to: 'artistas#nombre', as: :artista_nombre
  get 'artistas/:id/bio', to: 'artistas#bio', as: :artista_bio

  namespace :admin do
    resources :users, only: %i[edit update]
    resources :artistas
    resources :presentaciones, only: [:destroy]

    resources :encuentros do
      resources :conciertos, shallow: true, only: %i[index new create] do
        resources :presentaciones, shallow: true, only: %i[index new create edit]
      end
      resources :fotos, only: [:index]
      resources :config, only: [:index]
    end
  end
end
