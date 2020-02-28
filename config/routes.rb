Rails.application.routes.draw do
  

  root 'mainpages#index'

  resources :mainpages do
    collection do
      get 'ancestry_children'
      get 'ancestry_grand_children'
    end
  end

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
    end
  end

  resources :categories , only: [:show,:index]

  resources :items, except: :index do
    get 'purchase'
    post 'pay'
    get 'done'
    collection do
      get 'ancestry_children'
      get 'ancestry_grand_children'
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
