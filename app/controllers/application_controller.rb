class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  before_action :user_limitationed, only:[:show]

  private
  def login_required
    redirect_to new_session_path unless current_user
  end

  def user_limitationed
    user = User.find(params[:id])
    redirect_to tasks_path unless current_user == user
  end
end
