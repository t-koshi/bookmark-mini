require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookmarkMini
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = 'Asia/Tokyo'
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.assets false
      g.orm :active_record, primary_key_type: :uuid
      g.orm :active_record, foreign_key_type: :uuid
    end

    config.active_job.queue_adapter = :sidekiq
  end
end
