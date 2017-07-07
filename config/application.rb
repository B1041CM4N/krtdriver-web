require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KrtdriverWeb
  class Application < Rails::Application

    config.assets.compile = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.pluralize_table_names = false
    require 'i18n/backend/fallbacks'
    I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
    config.i18n.fallbacks = { 'es' => 'en' }
    I18n.locale = :es

    config.logger = Logger.new(STDOUT)
  end
end
