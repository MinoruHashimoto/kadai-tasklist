require 'active_support/concern'
module ForTasks
  extend ActiveSupport::Concern

  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end