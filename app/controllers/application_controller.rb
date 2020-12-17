class ApplicationController < ActionController::Base

  include SessionsHelper

  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def is_it_yours
    unless @task.user == @current_user
      flash[:danger] = 'そのタスクにはアクセスできません。'
      redirect_to root_url
    end
  end
      
  
end
