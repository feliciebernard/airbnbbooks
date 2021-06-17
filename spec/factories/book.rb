
require 'faker'

FactoryBot.define do
  factory :book do
    isbn { Faker::Number.between(from: 9790000000000, to: 9799999999999) }
    title { Faker::Book.title }
    authors { Faker::Book.author }
    publisher { Faker::Book.publisher }
    published_date { Faker::Date.between(from: 200.years.ago, to: Date.today) }
    language { Faker::Nation.language }
    categories { Faker::Book.genre }
    description { Faker::Lorem.sentences(number: rand(2..5)) }

    image_link  = ["https://res.cloudinary.com/dcmcouvju/image/upload/v1623320480/1_jxyqjl.jpg", "https://res.cloudinary.com/dcmcouvju/image/upload/v1623320482/22_xplnk1.jpg"]

    image_link { image_link.sample }
  end
end
