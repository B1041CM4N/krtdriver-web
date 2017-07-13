require_relative 'boot'

require 'rails/all'

# require 'google_maps_service'

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

    # Setup API keys
    # gmaps = GoogleMapsService::Client.new(key: 'AIzaSyDt_Bmvdd17vVX5CaoC_TLfQjDj-vzrWeU')

    # Setup client IDs
    # gmaps = GoogleMapsService::Client.new(
    #   client_id: 'Add your client id here',
    #   client_secret: 'Add your client secret here'
    # )

    # More complex setup
    # gmaps = GoogleMapsService::Client.new(
    #   key: 'AIzaSyBfTzvvp0hvqyEn6JkOmzmq45FzbrbsJZw',
    #   retry_timeout: 20,      # Timeout for retrying failed request
    #   queries_per_second: 10  # Limit total request per second
    # )

    # Setup global parameters
    # GoogleMapsService.configure do |config|
    #   config.key = 'AIzaSyBfTzvvp0hvqyEn6JkOmzmq45FzbrbsJZw'
    #   config.retry_timeout = 20
    #   config.queries_per_second = 10
    # end

    # Initialize client using global parameters
    # gmaps = GoogleMapsService::Client.new

    config.logger = Logger.new(STDOUT)
  end
end
