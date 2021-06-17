class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send


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

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  #méthode qui pour lui renvoie la liste de ces livre prétés
  def loan_books
    loan_books = nil
    self.own_books.each do |my_book|
      loan_books += my_book if my_book.loan.status == true
    end
  end

  #méthode qui renvoie la liste de ces livres dispo a l'emprunt
  
  def books_available
    available_books = nil
    self.own_books.each do |my_book|
      available_books += my_book if my_book.is_available?
    end
  end

end
