Rails.application.routes.draw do
  devise_for :users
  # must be above toilet resources to supersede toilets/:id
  get 'toilets/cancel_new', to: 'toilets#cancel_new'
  resources :toilets
  resources :reviews, only: [:create, :destroy]

  root 'toilets#index'
end
