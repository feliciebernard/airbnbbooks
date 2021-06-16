class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lenders, foreign_key: 'lender_id', class_name: "Loan"
  has_many :borrowers, foreign_key: 'borrower_id', class_name: "Loan"

  has_many :own_books
  has_many :books, through: :own_books

  has_one :private_adress
end
