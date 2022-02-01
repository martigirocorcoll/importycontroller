Rails.application.routes.draw do
  resources :sales
  resources :cobros
  resources :pagos
  resources :venta
  resources :compras
  resources :cars
  resources :operacions
  resources :personas
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
