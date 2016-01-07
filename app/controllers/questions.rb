get '/questions' do
	@questions = Question.all
	erb :'questions/index'
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'questions/show'
end

get '/questions/:question_id/comments/new' do
  @question = Question.find_by(id: params[:question_id])
  erb :"comments/new", layout: false
end

post '/questions/:question_id/comments' do
  comment = Comment.new()
end

post '/questions/:question_id/answers' do
end



post '/questions/:question_id/answers/:answer_id/comments' do

end
