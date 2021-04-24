class Admin::SessionsController < ApplicationController
  before_action:login_required,only:[:destroy]
  
  def new
  end

  def create
    user=User.find_by(email:session_params[:email])

    if user&.authenticate(session_params[:password]) && user.admin?
      session[:user_id]=user.id
      redirect_to "/admin/users",notice:'管理者権限でログインしました'
    else
      flash.now[:danger]="ログインに失敗しました"
      render :new
    end
  end

  def destroy
      reset_session
      redirect_to "/login",notice:"ログアウトしました"
  end

  private
  def session_params
    params.require(:session).permit(:email,:password)
  end

end
