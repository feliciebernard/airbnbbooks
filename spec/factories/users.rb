require 'faker'
FactoryBot.define do 

  name = Faker::Name.name_with_middle

  factory :user do
    name { Faker::Name.name_with_middle }
    password { Faker::Internet.password(Faker::Internet.password(min_length: 8)) }
    biography { Faker::Lorem.sentences(number: rand(3..7)) }
    email { Faker::Internet.email(name: name) }

  end
end
