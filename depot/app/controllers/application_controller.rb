class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Por favor, faça o login"
    end
  end

  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
  end
end
