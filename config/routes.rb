Rails.application.routes.draw do
  root 'flights#index'
  resources :airports
  resources :flights do
    resources :bookings
  end
end
