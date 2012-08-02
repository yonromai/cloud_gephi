FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :graph do
    description "Lorem ipsum"  
    source File.open(ENV['PWD'] + "/README.md")
    image "http://www.example.com/#{@user}/image"
    user
  end

end