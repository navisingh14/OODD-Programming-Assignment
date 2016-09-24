module SessionsHelper
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def remember(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  def current_admin?(admin)
    admin == current_admin
  end

  def log_out
    sessions.delete(:admin_id)
    @current_admin = nil
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !current_admin.nil?
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
