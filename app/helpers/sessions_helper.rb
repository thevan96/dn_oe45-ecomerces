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
end
