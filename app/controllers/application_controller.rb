class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale
  before_action :set_current_user
  before_action :init_cart

  def set_current_user
    session[:user_id] && Current.user = User.find_by(id: session[:user_id])
  end

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

  def require_logged_in
    return if session[:user_id].present?

    store_location
    redirect_to sign_in_path, alert: t(".required_sign_in")
  end
end
