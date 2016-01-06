def current_session?
  session[:user_id] != nil
end