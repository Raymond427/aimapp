class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def require_user
    redirect_to({ action: '/login' }, alert: 'You do not have access to that page. Please login') unless current_user
  end
  def require_editor
    redirect_to({ action: '/login' }, alert: 'You do not have access to that page. Please login') unless current_user.editor? || current_user.admin?
  end
  def require_admin
    redirect_to({ action: '/' }, alert: 'You must be an administrator to acces that page') unless current_user.admin?
  end
end
