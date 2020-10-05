Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#artistas'

  get '/admin', to: 'admin/encuentros#index', as: :admin

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :password_resets, only: %i[new create edit update]

  get 'home2020', to: 'home2#index'
  get 'artistas', to: 'home#artistas'
  get 'artistas/:id', to: 'home#artista', as: :artista
  get 'actividades', to: 'home#actividades'
  get 'conciertos', to: 'home#conciertos'
  get 'galeria', to: 'home#galeria'

  get 'vision', to: 'home#vision'
  get 'mision', to: 'home#mision'

  get 'artistas/:id/nombre', to: 'artistas#nombre', as: :artista_nombre
  get 'artistas/:id/bio', to: 'artistas#bio', as: :artista_bio

  get 'admin/artistas/for_select', to: 'admin/artistas#for_select', as: :artistas_for_select
  get 'admin/obras/for_select', to: 'admin/obras#for_select', as: :obras_for_select

  get 'admin/presentacion/:id/artistas/for_select', to: 'admin/presentaciones#artistas_for_select', as: :presentacion_artistas_for_select
  get 'admin/presentacion/:id/obras/for_select', to: 'admin/presentaciones#obras_for_select', as: :presentacion_obras_for_select

  get 'admin/etiquetas/for_select', to: 'admin/etiquetas#for_select', as: :etiquetas_for_select
  get 'admin/participantes/for_select', to: 'admin/participantes#for_select', as: :participantes_for_select

  patch 'admin/encuentros/:encuentro_id/artistas/:artista_id/toggle_visibilidad_artista', to: 'admin/config#toggle_visibilidad_artista', as: :toggle_visibilidad_artista
  post 'admin/artistas_visibles/:id/up', to: 'admin/artistas_visibles#up', as: :up_artista_visible
  post 'admin/artistas_visibles/:id/down', to: 'admin/artistas_visibles#down', as: :down_artista_visible

  namespace :admin do
    resources :users, only: %i[edit update]
    resources :artistas, :obras
    resources :attachments, only: [:destroy]
    resources :etiquetas
    resources :participantes

    resources :encuentros do

      resources :slides, shallow: true, only: %i[edit, destroy]

      resources :conciertos, shallow: true do
        resources :presentaciones, shallow: true, except: %i[show]
      end

      resources :fechas_actividades, shallow: true do
        resources :actividades, shallow: true, except: %i[show]
      end

      resources :actividades, shallow: true

      resources :fotos, only: [:index]
      resources :config, only: [:index]
      resources :artistas_visibles, shallow: true
    end
  end
end
