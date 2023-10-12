Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'
  get 'public_recipes', to: 'public_recipes#index'
  post 'toggle_public', to: 'recipes#toggle', as: 'toggle_public'

  resources :users, only: [:index, :show] do
    resources :new_recipes, only: [:index, :show, :new, :create, :destroy]
  end

  resources :users do
    resources :new_recipes do
      resources :recipe_foods
    end
  end  
  

  resources :foods
  resources :recipe_foods, only: [:create, :destroy]

  resources :new_recipes do
    resources :recipe_foods, only: [:index, :create, :destroy]
  end

  resources :new_recipes do
  member do
    patch 'public_toggle'
  end
end
end
