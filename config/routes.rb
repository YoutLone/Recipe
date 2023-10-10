Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :users, only: [:index, :show] do
    resources :new_recipes, only: [:index, :show, :new, :create, :destroy]
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
