Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home', to: 'home#index'
  get 'home2', to: 'home2#index'
  get 'home3', to: 'home3#index'
  get 'index4', to: 'home#index4'

  get 'artistas', to: 'home#artistas'
  get 'actividades', to: 'home#actividades'
  get 'conciertos', to: 'home#conciertos'
  get 'galeria', to: 'home#galeria'

end
