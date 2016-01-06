#show
get "/profile" do
  if current_session?
    @user = current_user
    erb :"/users/profile"
  else
    redirect "/"
  end
end
