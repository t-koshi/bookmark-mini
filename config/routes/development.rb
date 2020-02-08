if Rails.env.development?
  get '/rails/info/properties' => 'rails/info#properties'
  get '/rails/info/routes'     => 'rails/info#routes'
  get '/rails/info'            => 'rails/info#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
