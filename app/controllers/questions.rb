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
    @success =  "Your message has been posted."
    @user = current_user
    erb :'users/profile'
  else
    @fail = "Your message did not post."
    erb :'questions/new'
  end
end

get '/questions/:id' do
	@question = Question.find(params[:id])
  @comments_answers = Comment.where(commentable_type: "Question", commentable_id: @question.id)
  answers = Answer.where(question_id: @question.id)
  @comments_answers << answers
  p "@@@@@@@@@@@@@@@@"
  @comments_answers = @comments_answers.flatten
	erb :'questions/show'
end

get '/questions/:question_id/comments/new' do
  @question = Question.find_by(id: params[:question_id])
  erb :"comments/new", layout: false
end

post '/questions/:question_id/comments' do
  user_id = session[:user_id]

  if request.xhr?
    puts "ajax request called"
    content = params[:content]
    comment = Comment.new(author_id: user_id, content: content)
    question = Question.find(params[:question_id])
    if question.comments << comment
      comment.save
    else
      puts "Error, Danger Will Robinson!"
    end
  end
end

get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
  erb :"answers/new", layout: false
end

post '/questions/:question_id/answers' do
  user_id = session[:user_id]

  if request.xhr?
    puts "ajax request called"
    content = params[:content]
    answer = Answer.new(author_id: user_id, content: content)
    question = Question.find(params[:question_id])
    if question.answers << answer
      answer.save
    else
      puts "Error, Danger Will Robinson!"
    end
  end
end



post '/questions/:question_id/answers/:answer_id/comments' do

end
