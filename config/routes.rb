Rails.application.routes.draw do
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
    get 'location_and_hierarchy' => 'organizations#location_and_hierarchy'
    get 'stock_management' => 'organizations#stock_management'
    resources :farmers
    resources :labourers
    resources :farms
    resources :users do
      post 'add_role' => 'users#add_role'
    end
    resources :roles
    resources :location_types
    resources :locations
    resources :stock_types
    resources :stock_items
    resources :storages
    resources :stock_sources
  end
  

  # => SESSION
  resources :sessions, only:[:new, :create, :destroy]
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'register' => 'users#new'
  #get "reset" => "account_activations#new"
  resources :account_activations, only: [:edit] 
  post "activate_with_password" => "account_activations#activate_with_password" 
  # => SESSION END

  resources :users

  # modules
  #get 'dashboard' => 'modules#index'

  # modules end

end
