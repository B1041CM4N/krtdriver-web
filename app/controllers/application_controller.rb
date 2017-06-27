class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_locale
  before_action :set_active

  def self.fetch(params = {})
    collection = pagination_filter(self, params)
    collection = search_filter(collection, params)
    collection = boolean_filter(collection, 'visible', params)
    collection = date_filter(collection, 'created_at', params)
    collection = date_range_filter(collection, 'created_at_range', params)
    collection = order_filter(collection, params)
    collection
  end

  def current_locale
    I18n.locale
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_active
    @active = controller_name
  end

  def set_module
    @module = ''
  end
end
