get '/questions' do
	@questions = Question.all
	erb :'questions/index'
end

get '/questions/new' do
  # if request.xhr?
  erb :'questions/new'
end


post '/questions' do

  @question = Question.new(params[:question])
  @question.author = current_user
  if @question.save
    @sucesss =  "Your message has been posted."
    redirect '/profile'
  else
    @fail = "Your message did not post."
    erb :'questions/new'
  end
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'questions/show'
end