require 'rails_helper'
require 'spec_helper'

RSpec::Matchers.define :be_a_correct_email_format do |expected|
  match do |actual|
    REGEX_EMAIL = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    actual.match(REGEX_EMAIL)
  end
end

RSpec.describe User, type: :user do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#name" do
      it "should not be valid without a name" do
        bad_user = FactoryBot.create(:user)
        bad_user.update(name: nil)
        expect(bad_user).not_to be_valid
        expect(bad_user).errors.include?(:name).to eq(true)
      end

      it "should not be lower that 3 characters" do
        invalid_user = @user.update(name: "sa")
        expect(invalid_user).not_to be_valid
        expect(invalid_user).errors.include?(:name).to eq(true)
      end

      it "should contain only alpha characters" do
        invalid_user = @user.update(name:"hjdhd_")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:name)).to eq(true)
      end
    end

    describe "#email" do
      it "should not be valid without email" do
        invalid_user = @user.update(email: nil)
        expect(invalid_user).not_to be_valid
        expect(invalid_user).errors.include?(:email).to eq(true)
      end

      it "should respect a correct email format" do
        bad_user = FactoryBot.create(:user, email: "hsjsjsh@@gmail.com")
        expect(actual).not_to match(/regex/)
        expect(bad_user).errors.include?(:email).to eq(true)
      end
    end

    describe "#biographie" do

      it "should not be greater than 200 charachters and lower than 20 char" do
        invalid_user = FactoryBot.create(:user, biography: Faker::Lorem.paragraph_by_chars(number: 201, supplemental: false)) 
        expect(invalid_user).to be_between(20, 200).inclusive
      end
    end
  end

  context "association" do
    describe "own_books" do
      it { expect(@user).to have_many(:own_book) }
    end
  end
end
