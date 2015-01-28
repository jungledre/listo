class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_authenticated?
    redirect_to root_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def default_score
    @score = 10
  end

  def is_event
    @user = current_user
    @happening = false
    created_at = @user.events.last.created_at
    while (Time.now - created_at).seconds < 10800
      @happening = true
    end
  end
end
