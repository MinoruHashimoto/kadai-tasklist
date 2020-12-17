require 'active_support/concern'
module ForTasks
  extend ActiveSupport::Concern
  def is_it_yours
    unless @task.user == @current_user
    redirect_to root_url
    end
  end    
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end