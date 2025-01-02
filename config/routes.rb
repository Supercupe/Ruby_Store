Rails.application.routes.draw do

  devise_for :admins
  resources :products
  resource :admin, only: [:show], controller: :admin
  devise_for :users
  root "products#index"
  resources :products do
    resources :subscribers, only: [ :create ]
    resource :buy_now, only: [:show, :create], controller: :buy_now do 
      get "success", on: :collection
    end
  end
  resource :unsubscribe, only: [ :show ]
end
