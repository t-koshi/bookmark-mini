Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users, path: 'auth'
  resource :me, only: %i(index)
  namespace :me do
    resources :bookmarks, only: %i(index new create destroy) do
      get :confirm, on: :collection
    end
  end
  draw :development
end
