Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_address'
    post 'deliver_addresses', to: 'users/registrations#create_address'
  end
  root "buys#index"
  resources :mainpages do
    collection do
      get 'logout'
      get 'new_credit_card'
    end
  end
  resources :items,only: :index
end
