FactoryBot.define do 
  factory :own_book do
    rating { rand(1..5) }
    review { Faker::Lorem.sentences(number: rand(2..5)) }
    available {  [true, false].rand(0..1) }
    user { FactoryBot.create(:user) }
  end
end

