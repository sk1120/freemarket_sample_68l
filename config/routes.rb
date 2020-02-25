Rails.application.routes.draw do
  

  root 'mainpages#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_address'
    post 'deliver_addresses', to: 'users/registrations#create_address'
  end

  resources :users ,only: :show do
    member do
      get 'logout'
      get 'new_credit_card'
    end
  end

  resources :categories , only: [:show,:index]

  resources :items, except: :index do
    collection do
      get 'ancestry_children'
      get 'ancestry_grand_children'
    end
  end
  resources :items,only: [:index, :show]
  resources :categories, only: [:index, :show]

end
