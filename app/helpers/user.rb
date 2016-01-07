helpers do
  def current_user
    @current_user = User.find_by(id: session[:id])
  end

  def current_session?
    session[:user_id]
  end

end
