Rails.application.routes.draw do
  # customized route dashboard
  get "dashboard" => 'dashboard#index', as: :dashboard
  get 'dashboard/properties'
  get 'dashboard/reports'
  resources :properties
  devise_for :accounts
  devise_scope :account do
    get '/accounts/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'public#main'
end
