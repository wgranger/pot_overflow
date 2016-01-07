get '/questions' do
	@questions = Question.all
	erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  redirect '/profile'
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'questions/show'
end