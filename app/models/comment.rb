class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :commentable, polymorphic: :true

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
