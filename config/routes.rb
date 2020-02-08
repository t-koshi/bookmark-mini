Rails.application.routes.draw do
  root to: 'me#index'
  devise_for :users, path: 'auth'
  resources :me, only: %i(index)
  draw :development
end
