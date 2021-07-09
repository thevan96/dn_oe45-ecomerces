class SessionsController < ApplicationController
  before_action :find_user, only: [:create]

  def new
    redirect_to root_path if current_user.present?
  end

  def create
    if @user.authenticate params[:password]
      handle_actived
    else
      flash.now[:error] = t ".invalid_email_password"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    @current_user = nil
    redirect_to root_path
  end

  private

  def handle_actived
    if @user.actived
      session[:user_id] = @user.id
      redirect_back_or root_path, t(".logged_success")
    else
      flash[:alert] = t ".account_not_actived"
      render :new
    end
  end

  def find_user
    @user = User.find_by email: params[:email]
    return if @user

    flash.now[:error] = t ".invalid_email_password"
    render :new
  end
end
