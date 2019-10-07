Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home', to: 'home#index'
  get 'home2', to: 'home2#index'
  get 'home3', to: 'home3#index'
  get 'index4', to: 'home#index4'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'artistas', to: 'home#artistas'
  get 'actividades', to: 'home#actividades'
  get 'conciertos', to: 'home#conciertos'
  get 'galeria', to: 'home#galeria'

  namespace :admin do
    resources :encuentros, shallow: true

    resources :users, only: [:edit, :update]

  end
end
