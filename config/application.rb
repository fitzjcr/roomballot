require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Roomballot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Fixup
    Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true

    # Use a single named logfile for Rails
    logfile = Rails.root.join('log', 'rails.log')
    Rails.logger = Logger.new(logfile)

    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
