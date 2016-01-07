class Question < ActiveRecord::Base
  validates :title, :content, { presence: true }

  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  def vote_count
    return 0 if self.votes.count == 0
    total = []
    self.votes.each do |vote|
      total << vote.value
    end
    total.inject{|sum,x| sum + x }
  end

end
