Rails.application.routes.draw do
  root "salepages#index"
  resources :item_images, only: [:index, :create, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_address'
    post 'deliver_addresses', to: 'users/registrations#create_address'
  end
  
end
