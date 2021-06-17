RSpec.describe Book, type: :book do
  before(:each) do
    @book = FactoryBot.create(:book)
  end
  context "validation" do
    describe "some attributes" do
      it "is valid with valid attributes" do
        expect(@book).to be_a(Book)
        expect(@book).to be_valid
      end

      it "should be valid without any argument except ISBN" do
        valid_book = @book.update(title: nil, authors: nil, publisher: nil, published_date: nil, language: nil, categories: nil, description: nil)
        expect(valid_book).to be_a(Book)
        expect(valid_book).to be_valid
      end

      it "should not be valid with nil ISBN" do
        @book.isbn = nil
        expect(@book).not_to be_valid
      end
    end
    context "association" do
      describe "#book has_many #own_books" do
        it { expect(@book).to has_many(:loans) }
      end
    end
  end
end
