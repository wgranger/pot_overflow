get "/" do
  redirect 'questions'
end

get "/login" do
  erb :login
end

post "/login" do
  user = User.find_by(name: params[:name])
  puts user
  if request.xhr?
    if user != nil
      if user.authenticate(params[:name], params[:password])
        session[:user_id] = user.id
        redirect "/"
      else
       request = { :error => true, :response => "Your password is incorrect."}
      end
    else
       request = { :error => true, :response => "We could not find your username."}
    end
  else
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
end

get '/logout' do
  session.clear
  redirect '/'
end
