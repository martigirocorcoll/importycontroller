Rails.application.routes.draw do
  resources :sales
  get '/sales/reserva/:id', to: 'sales#contratreserva', as: 'reserva'
  resources :cobros
  resources :pagos
  resources :compras
  resources :cars
  resources :operacions
  resources :personas
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
