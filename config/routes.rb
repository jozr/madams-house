Rails.application.routes.draw do

  root to: 'dens#index'

  devise_for :users

  resources :dens
end
