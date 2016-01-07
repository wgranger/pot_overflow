#show
get "/profile" do

  if current_session?
    p session
    p session[:id]
      p current_session?
      p current_user
    @user = current_user
    p @user
    logger.info @user
    erb :'users/profile'
  else
    redirect '/'
  end
end

get '/user/new' do
  erb :'users/new'
end

post '/user/new' do
  new_user = User.new(params[:user])
  if new_user.save
    redirect '/login'
  else
    @error = "You must include a unique username and email, as well as a password."
    erb :'users/new'
  end
end