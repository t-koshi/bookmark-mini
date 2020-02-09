Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users, path: 'auth'
  resource :me, only: %i(index)
  namespace :me do
    resources :bookmarks, only: %i(index new create destroy) do
      get :confirm, on: :collection
    end
  end
  get '/web_resources/:web_resource_id/entry/:user_id', to: 'web_resources#entry', as: :bokmark_entry
  draw :development
end
