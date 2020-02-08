Sidekiq.configure_server do |config|
  config.redis = {
      url: "redis://#{ENV['REDIS_HOST']}:6379",
      password: ENV['REDIS_PASSWORD']
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
      url: "redis://#{ENV['REDIS_HOST']}:6379",
      password: ENV['REDIS_PASSWORD']
  }
end
