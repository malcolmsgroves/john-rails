Rails.application.routes.draw do
  resources :toilets
  root 'toilets#index'
end
