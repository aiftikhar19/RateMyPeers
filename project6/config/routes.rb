Rails.application.routes.draw do
  resources :evaluates
  resources :ratings
  resources :courses
  resources :groups
  resources :memberships
  resources :welcomes
  get '/welcomes/confirmation', to: 'welcomes#confirmation'
 
  devise_for :users
  root 'welcomes#index'

  get  '/signup', to: 'welcomes#signup'
  get  '/login', to: 'welcomes#login'



end
# controllers {sesions: "users/sessions"}