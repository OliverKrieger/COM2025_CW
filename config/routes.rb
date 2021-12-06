Rails.application.routes.draw do
  devise_for :users
  # Resources
  resources :campaigns
  resources :characters

  # Contact Page
  get 'contact', to: 'contact#contact' #redirect
  post 'request_contact', to: 'contact#request_contact'

  # Home page / root where we arrive at
  root 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
