Rails.application.routes.draw do
  resources :location_types
  resources :locations
  # resources :farms
  # resources :labourers
  # resources :districts
  # resources :farmers
  root to: "static_pages#index"
  get 'dashboard' => 'static_pages#dashboard'

  resources :organizations do
    post 'add_member' => 'organizations#add_member'
    get 'farm_and_labour' => 'organizations#farm_and_labour'
    get 'user_and_role' => 'organizations#user_and_role'
    resources :farmers
    resources :labourers
    resources :farms
    resources :users do
      post 'add_role' => 'users#add_role'
    end
    resources :roles
  end
  

  # => SESSION
  resources :sessions, only:[:new, :create, :destroy]
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  #get "reset" => "account_activations#new"
  # => SESSION END

  resources :users

  # modules
  #get 'dashboard' => 'modules#index'

  # modules end

end
