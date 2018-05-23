Rails.application.routes.draw do
  root 'users#log'


  resources :users do
    resources :sales
  end

  resources :customers

  resources :computers
  
  resources :skulists

  get 'process' => 'skulists#proc'

  post 'sessions' => 'sessions#create'

  delete 'sessions' => 'sessions#destroy'

  get 'colors/:colors' => 'users#colors'

  get 'storeset/:set' => 'sessions#storeset'

end
