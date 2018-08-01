require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DelayedJobsDemo
  class Application < Rails::Application
    config.assets.precompile << 'delayed/web/application.css'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_job.queue_adapter = :delayed_job
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
