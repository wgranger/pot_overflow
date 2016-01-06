10.times do
  User.create(
    name: Faker::Name.name
    email: Faker::Internet.email
    password: Faker::Internet.password
    )

  Question.create(
    title: Faker::Name.title
    content: Faker::Lorem.sentence
    author: User.find(rand(1..10))
    )

  Answer.create{
    content: Faker::Lorem.paragraph
    question: Question.find(rand(1..10))
    author: User.find(rand(1..10))
  }

end

