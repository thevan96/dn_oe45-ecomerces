class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale
  before_action :set_current_user

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
end
