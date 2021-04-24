class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find_by(id:session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_url,notice:'ログインが必要です' unless current_user
  end

  def admin_login_required
    redirect_to root_url,notice:"管理者権限が必要です" unless current_user.admin?
  end
end