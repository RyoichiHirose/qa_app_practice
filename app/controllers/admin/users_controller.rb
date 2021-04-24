class Admin::UsersController < ApplicationController
  before_action:login_required
  before_action:admin_login_required
  
  def index
    @users=User.all
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    flash[:notice]="ユーザー「#{@user.name}」を削除しました"
    redirect_to "/admin/users"
  end
end
