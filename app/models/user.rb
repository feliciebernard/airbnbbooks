class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  after_create :welcome_send


  has_many :lenders, foreign_key: 'lender_id', class_name: "Loan"
  has_many :borrowers, foreign_key: 'borrower_id', class_name: "Loan"

  has_many :loans
  has_many :own_books
  has_many :books, through: :own_books

  has_one :private_adress



  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
