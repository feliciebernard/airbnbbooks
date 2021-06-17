Rspec.describe Loan, type: :loan do
  before(:each) do
    @loan = FactoryBot.create(:loan)
  end

  context "validation" do
    describe "some attributes" do
      it "is valid with valid attribute" do
        expect(@loan).to be_a(Loan)
        expect(@loan).to be_valid
      end

    describe "#rating" do
      it "should be between 1 and 5" do
        bad_loan = FactoryBot.create(:loan, :user)
        bad_loan = FactoryBot.to be_kind_of(Integer)
        bad_loan.expect.to be_between(0, 5)
      end
    end

    describe "#review" do
      it "should be between 3 and 2000" do
        bad_loan.expect.to be_between(3, 2000)
        bad_loan = FactoryBot.to be_kind_of(Integer)
      end
    end
  end

  context "association"

    describe "#loan belong_to #loaner" do
      it { expect(@loan).to belong_to(:lainder) }
    end
    describe "#loan belong_to #borrower" do
      it { expect(@loan).to belong_to(:borrower) }
    end
  end
end

