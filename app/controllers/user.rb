#show
get "/profile" do
  # We are using this for temp login
  session[:user_id] = 1
  # if logged_in?
    @user = User.find(session[:user_id])
    erb :"/users/profile"
  # else
  #   redirect "/"
  # end
end
