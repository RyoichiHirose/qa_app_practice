class UsersController < ApplicationController
  before_action:login_required,only:[:index]
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to users_path,notice:"Welcome to Q&A App!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end
end
