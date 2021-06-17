class Book < ApplicationRecord
  has_many :own_books
  has_many :users, through: :own_books

  #after_create :create_own_book

  validates :isbn, presence: { message: "merci de renseigner le code isbn a 13 chiffres (au dos du livre) afin que votre livre soit correctement enregistrer " }
end

