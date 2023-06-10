class UsersController < ApplicationController
  before_action :user_limitationed, only:[:show]
  skip_before_action :login_required, only:[:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    
    if params[:sort_end_date]
      @tasks = @user.tasks.order(:end_date).page(params[:page])

    elsif params[:search].present?
      if task_name_params.present? && status_params.present?        
        @tasks = @user.tasks.search_task_name(task_name_params).search_status(status_params).page(params[:page])

      elsif task_name_params.present?        
        @tasks = @user.tasks.search_task_name(task_name_params).page(params[:page])

      elsif status_params.present?
        @tasks = @user.tasks.search_status(status_params).page(params[:page])
      else
        @tasks = @user.tasks.order(created_at: :desc).page(params[:page])
      end
      
    else
      @tasks = @user.tasks.order(created_at: :desc).page(params[:page])
      
    end

  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

  def task_name_params 
    params[:search][:task_name]
  end

  def status_params
    params[:search][:status]
  end

end
