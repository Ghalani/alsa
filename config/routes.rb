Rails.application.routes.draw do
  # resources :labourers
  # resources :districts
  # resources :farmers
  root to: "static_pages#index"
  get 'dashboard' => 'static_pages#dashboard'

  resources :organizations do
    post 'add_member' => 'organizations#add_member'
    get 'farm_and_labour' => 'organizations#farm_and_labour'
    resources :farmers
    resources :labourers
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
