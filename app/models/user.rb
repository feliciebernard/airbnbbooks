class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  has_many :lenders, foreign_key: 'lender_id', class_name: "Loan"
  has_many :borrowers, foreign_key: 'borrower_id', class_name: "Loan"

  has_many :own_books
  has_many :books, through: :own_books

  has_one :private_adress

  validates :name, 
    presence: true,
    length: { in: 3..100 },
    format: { with: /[[:alpha:]]-[[:alpha:]]/,
              message: "le nom doit contenir seulement des caractères 
              alphabétiques (aA) avec en option un tiret pour séparer un double nom" }

  #password 8 chars minimum
  validates :biography, length: { in: 20..200 }
  


end
