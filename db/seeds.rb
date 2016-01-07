10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    )
end

10.times do
  Question.create(
    title: Faker::Name.title,
    content: Faker::Lorem.sentence,
    author: User.find(rand(1..10))
    )
end

10.times do
  Answer.create(
    content: Faker::Lorem.paragraph,
    question: Question.find(rand(1..10)),
    author: User.find(rand(1..10))
    )
end

10.times do
  Question.find(rand(1..10)).votes << Vote.create(voter_id: User.find(rand(1..10)).id, value: 1)
end