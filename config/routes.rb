Rails.application.routes.draw do
  resources :patients
  devise_for :employees
  root "patients#index"
  get "qr/code"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
