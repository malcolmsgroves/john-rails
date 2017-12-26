Rails.application.routes.draw do
  # must be above toilet resources to supersede toilets/:id
  get 'toilets/cancel_new', to: 'toilets#cancel_new'
  resources :toilets

  root 'toilets#index'
end
