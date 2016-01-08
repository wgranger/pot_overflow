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
  @comments_answers = Answer.where(question_id: @question.id)
  comments = Comment.where(commentable_type: "Question", commentable_id: @question.id)
  @comments_answers << comments
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


get '/questions/:question_id/answers/:answer_id/upvote' do
  answer = Answer.find(params[:answer_id])
  answer.votes.create(value: 1, voter_id: session[:user_id])
  vote_count = answer.vote_count.to_s
  if request.xhr?
    response = { :votes => vote_count, :id => params[:answer_id] }
    response.to_json
  else
    redirect "/questions/#{params[:question_id]}"
  end
end

get '/questions/:question_id/answers/:answer_id/downvote' do
  answer = Answer.find(params[:answer_id])
  answer.votes.create(value: -1, voter_id: session[:user_id])
  vote_count = answer.vote_count
  if request.xhr?
    response = { :votes => vote_count, :id => params[:answer_id] }
    response.to_json
  else
    redirect "/questions/#{params[:question_id]}"
  end
end

get '/questions/:id/upvote' do
  question = Question.find(params[:id])
  question.votes.create(value: 1, voter_id: session[:user_id])
  vote_count = question.vote_count
  if request.xhr?
    response = vote_count.to_s
  else
    redirect "/questions/#{params[:id]}"
  end
end

get '/questions/:id/downvote' do
  question = Question.find(params[:id])
  question.votes.create(value: -1, voter_id: session[:user_id])
  vote_count = question.vote_count
  if request.xhr?
    response = vote_count.to_s
  else
    redirect "/questions/#{params[:id]}"
  end
end

