Rails.application.routes.draw do
  root "tasks#index"

  post "/tasks/:id/toggle", to: "tasks#toggle"

  resources :comments, only: [:create, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
  get "signout" => "sessions#destroy"

  resources :tasks

  resources :users
end
