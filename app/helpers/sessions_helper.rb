module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  def current_user
    logger.debug "Called current_user - 1#{@current_user} session[:user_id] #{session[:user_id]}"
    logger.debug "@current_user: #{(@current_user ?  'true' : 'false')}"
    # that was incorrect because it toggled the current user! - || has precedence over ?
    # @current_user = @current_user || session[:user_id].nil? ? nil : User.find_by(id: session[:user_id])
    # thus, either with explicit parantheses:
    # @current_user = @current_user || (session[:user_id].nil? ? nil : User.find_by(id: session[:user_id]))
    # or, using the correct ruby idiom:
    @current_user ||= session[:user_id].nil? ? nil : User.find_by(id: session[:user_id])
    logger.debug "Called current_user - 2#{@current_user} session[:user_id] #{session[:user_id]}"
    logger.debug "@current_user: #{(@current_user ?  'true' : 'false')}"
    return @current_user
  end
  def logged_in?
    logger.debug "Called logged_in -1#{@current_user} session[:user_id] #{session[:user_id]}"
    logger.debug "@current_user: #{(@current_user ?  'true' : 'false')}"
    result = !current_user.nil?
    logger.debug "Called logged_in -2#{@current_user} - result #{result} session[:user_id] #{session[:user_id]}"
    logger.debug "@current_user: #{(@current_user ?  'true' : 'false')}"
    return result
  end
protected
  def authorize
    unless current_user
      redirect_to login_url, notice: "Please log in"
    end
  end
end
