module ApplicationHelper
  def logged_out
    if session[:user_id]
      redirect_to root_path, notice: 'You must be logged in before accessing this site.'
    end
  end

  def logged_in
    if session[:user_id] == nil
      redirect_to login_path, notice: "Must sign in :p"
    end
  end

  def activity_owner
    if session[:user_id].to_s != Activity.find(params[:id]).user_id.to_s
      redirect_to root_path, notice: "ACCESS DENIED"
    end
  end

  def correct_user
    if session[:user_id].to_s != params[:id]
      redirect_to root_path, notice: "ACCESS DENIED"
    end
  end
end
