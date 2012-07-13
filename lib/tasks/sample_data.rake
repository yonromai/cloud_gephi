namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@example.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      description = Faker::Lorem.sentence(5)
      users.each { |user| user.graphs.create!(description: description,
                                                  image: "https://gephi.org/wp-content/themes/gephi/images/screenshots/layout2.png",
                                                  source: "https://gephi.org/datasets/eurosis.gexf.zip") }
    end

  end
end