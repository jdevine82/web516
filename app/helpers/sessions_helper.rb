module SessionsHelper
  

  # Logs in the given user.
  def log_in(officer)
    session[:officer_id] = officer.id
  end
  def current_officer
    @current_officer ||= Officer.find_by(id: session[:officer_id])
  end
  
  def logged_in?
    !current_officer.nil?
  end
  # Logs out the current user.
  def log_out
    session.delete(:officer_id)
    @current_officer = nil
  end
end

