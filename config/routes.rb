Rails.application.routes.draw do
  resources :campaigns
  get 'contact/contact'
  post 'request_contact', to: 'contact#request_contact'
  root 'home#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
