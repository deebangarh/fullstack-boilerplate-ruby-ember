Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :accounts, only: [:index]
  resources :transactions, only: [:index, :show, :create]
  get '/ping', to: 'ping#show', format: :json, as: :ping
end
