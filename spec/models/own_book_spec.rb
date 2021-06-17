
RSpec.describe OwnBook, type: :own_book do
  before(:each) do
    @own_book = FactoryBot.create(:user)
  end

  context "validation" do
    describe "some attributes" do
      it "is valid with valid attribute" do
        expect(@own_book).to be_a(OwnBook)
        expect(@own_book).to be_valid
      end

      it "should be valid without review and rating" do
        own_book = FactoryBot.create(:own_book, review: nil, rating: nil)
        expect(own_book).to be_a(OwnBook)
        expect(own_book).to be_valid
      end
    end

    describe "#rating" do
      it "should be between 1 and 5" do
        bad_own_book = FactoryBot.create(:own_book, :user)
        bad_own_book = FactoryBot.to be_kind_of(Integer)
        bad_own_book.expect.to be_between(0, 5)
      end
    end

    describe "#review" do
      it "should be between 3 and 2000" do
        bad_own_book.expect.to be_between(3, 2000)
        bad_own_book = FactoryBot.to be_kind_of(Integer)
      end
    end
  end
#  context "association"
#
#    describe "#own_book belong_to #user" do
#      it { (@own_book).to belong_to(:user) }
#    end
#    describe "#own_book belong_to #book" do
#      it { expect(@own_book).to belong_to(:book) }
#    end
#    describe "#own_book has_many #loans" do
#      it { expect(@own_book).to has_many(:loans) }
#    end
#    describe "#own_book has_many #private_messages" do
#      it { expect(@own_book).to has_many(:private_messages) }
#    end
end
