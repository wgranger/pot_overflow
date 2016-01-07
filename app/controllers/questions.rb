get '/questions' do
	@questions = Question.all
	erb :'questions/index'
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'questions/show'
end

post 'questions/:id/comment/new' do
end

post 'questions/:id/answer/new' do
end

post 'questions/:id/answer/:id/comment' do
end
