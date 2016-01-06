class User < ActiveRecord::Base
  validates :name, :email, { presence: true, uniqueness: true }

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(name, password)
    self.name == name
    self.password == password
  end
  
end
