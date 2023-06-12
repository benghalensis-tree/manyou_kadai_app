class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  
  private
  def login_required
    redirect_to new_session_path unless current_user
  end

  def user_limitationed
    user = User.find(params[:id])
    redirect_to tasks_path, notice: '不正なアクセスです' unless current_user == user
  end

  def admin_required
    unless current_user.admin? == true
      redirect_to tasks_path, notice: '管理者権限がありません'
    end
  end
end
