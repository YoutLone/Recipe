Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  root 'foods#index'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipe_foods, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end