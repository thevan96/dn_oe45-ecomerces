module SessionsHelper
  def logged_in?
    current_user.present?
  end

  def current_user
    session[:user_id] && @current_user = User.find_by(id: session[:user_id])
  end

  def amount_product
    session[:cart].values.sum
  end

  def product_in_cart? id
    session[:cart].keys.include? id.to_s
  end

  def redirect_back_or default, message
    redirect_to session[:forwarding_url],
                notice: (message unless message.empty?) || default
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
