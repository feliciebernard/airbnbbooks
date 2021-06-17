class OwnBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :loans

  before_destroy :destroy_books, :if :is_any_other_own_book_similar?

  validates :rating, format: { with: /[0-5]/ }
  validates :review, lenght: { in: 3..2000 }

  def is_available?
    self.loans.order("updated_at DESC").first.is_returned
  end

  #détruit le livre OwnBook dans la base de donnée Book seulement 
  #si un cet isbn est le seul parmis les OwnBooks
  #
  def is_any_other_own_book_similar?
    book = self.book
    Book.find(id: book.id).own_books.length == 1 ? true : false
  end

end
