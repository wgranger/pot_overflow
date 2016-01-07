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
    @success = "Your question has been posted."
  else
    @failure = "We were unable to post your question. Please try again."
  end
  @user = current_user
  erb :'users/profile'
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	erb :'questions/show'
end
