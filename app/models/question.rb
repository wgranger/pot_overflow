class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

end
