FactoryBot.define do
  factory :loan do
    lander  { FactoryBot.create(:user) }
    borrower  { FactoryBot.create(:own_book) }
    status { [true, false].sample }
  end
end
