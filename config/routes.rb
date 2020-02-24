Rails.application.routes.draw do
  root 'salepages#index'
  resources :items

  resources :item_images, only: [:index, :create, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_address'
    post 'deliver_addresses', to: 'users/registrations#create_address'
  end
  resources :salepages,only: [:create] do
    collection do
      get 'ancestry_children'
      get 'ancestry_grand_children'
    end
  end
  root "mainpages#index"

  resources :mainpages do
    collection do
      get 'logout'
      get 'new_credit_card'
    end
  end
  resources :items,only: :index
end
