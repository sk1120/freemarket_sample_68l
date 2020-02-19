Rails.application.routes.draw do
  root "items#new"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_address'
    post 'deliver_addresses', to: 'users/registrations#create_address'
  end
  resources :items
  
end
