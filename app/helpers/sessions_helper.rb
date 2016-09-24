module SessionsHelper

  def log_in(member)
    session[:member_id] = member.id
  end

  def current_member?(member)
    member == current_member
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])
  end

  def remember(member)
    member.remember
    cookies.permanent.signed[:member_id] = member.id
    cookies.permanent[:remember_token] = member.remember_token
  end

  def logged_in?
    !current_member.nil?
  end

  def log_out
    session.delete(:member_id)
    @current_member = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
