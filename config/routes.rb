Rails.application.routes.draw do

  # root "mainpage#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'deliver_addresses', to: 'users/registrations#new_address'
    post 'deliver_addresses', to: 'users/registrations#create_address'
  end
  root "mainpages#index"
# >>>>>>> remotes/origin/master
end
