class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_locale

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
    @module = ""
  end
end
