class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User"

  has_many :answers, as: :commentable
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

end