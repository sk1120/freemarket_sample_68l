Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "mainpages#index"
  resources :mainpages do
    collection do
      get 'logout'
    end
  end
end
