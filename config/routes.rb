Rails.application.routes.draw do
  resources :flujos
  resources :prestamos
  resources :sales
  get '/sales/reserva/:id', to: 'sales#contratreserva', as: 'reserva'
  get '/sales/reserva/100/:id', to: 'sales#contratreserva100', as: 'reserva100'
  get '/sales/factura/:id', to: 'sales#factura', as: 'factura'
  get '/prestamos/prestamo/:id', to: 'prestamos#contratoprestamo', as: 'contratoprestamo'
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
