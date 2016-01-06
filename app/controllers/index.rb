get "/" do
  erb :index
end

get "/login" do
  erb :login
end

post "/login" do
  user = User.find_by(name: params[:name])
  if user != nil
    if user.authenticate(params[:name], params[:password])
     session[:user_id] = user.id
     redirect "/"
    else
     @error = "Your password is incorrect."
     erb :login
    end
  else
     @error = "We could not find your username."
     erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end