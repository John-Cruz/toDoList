module SessionsHelper
  def logged_out
    if session[:user_id]
      redirect_to root_path, notice: 'You must be logged in before accessing this site.'
    end
  end

  def logged_in
    if session[:user_id] == nil
      redirect_to root_path, notice: "Already logged out :p"
    end
  end
end
