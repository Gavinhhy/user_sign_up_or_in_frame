class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user

    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    #redirect_to root_url
    redirect_to posts_url, notice: '没有操作权限!'
  end

end
