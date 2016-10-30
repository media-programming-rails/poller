module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  def current_user
    @current_user = @current_user || session[:user_id].nil? ? nil : User.find_by(id: session[:user_id])
  end
  def logged_in?
    !current_user.nil?
  end
protected
  def authorize
    unless current_user
      redirect_to login_url, notice: "Please log in"
    end
  end
end
