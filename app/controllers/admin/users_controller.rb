class Admin::UsersController < ApplicationController
  before_action :admin_required
  
  def index
    @users = User.all.includes(:tasks)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update  
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.order(created_at: :desc)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "タスクを削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :admin)
  end
end
