get "/" do
  erb :index
end

get "/login" do
  erb :login
end

post "/login" do
  user = User.find_by(name: params[:name])
  if user.authenticate(params[:name], params[:password])
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = user.errors.full_messages
    erb :login
end

get '/logout' do
  session.clear
  redirect '/'
end