module CurrentUserConcern
  extend ActiveSupport::Concern

  included { before_action :set_current_user }

  def set_current_user
    puts 'in currentUserConcern set_current_user||||||||||||||||||||||||||||||||||||'
    puts session[:user_id]
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end
