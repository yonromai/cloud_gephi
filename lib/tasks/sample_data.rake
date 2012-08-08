namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_graphs
    make_relationships
  end 
end

def make_users
  admin = User.create!(name: "Example User",
                       email: "example@example.org",
                       password: "foobar",
                       password_confirmation: "foobar")

  admin.toggle!(:admin)
  30.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@example.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end 
end

def make_graphs
  users = User.all(limit: 6)
  25.times do
    description = Faker::Lorem.sentence(5)
    file = File.open(ENV['PWD'] + "/spec/resources/sample.gexf")
    users.each do |user| 
      graph = user.graphs.build(
                        description: description,
                        source: file)
      graph.image = "https://s3.amazonaws.com/dev-cloudgephi/users/testUser/graphs/42/sample"
      graph.save!
    end
  end 
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end