class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale
  before_action :init_cart

  add_flash_types :error

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def init_cart
    session[:cart] ||= {}
  end
end
