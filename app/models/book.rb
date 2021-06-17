class Book < ApplicationRecord
  has_many :own_books
  has_many :users, through: :own_books

  after_create :create_own_book

  validates :isbn, presence: true, message: "merci de renseigner le code isbn a 13 chiffres (au dos du livre) afin que votre livre soit correctement enregistrer "

  #si le code isbn ne correspond a aucun livre enregistrer par google_books ou par nous alors il renvoie une erreur qui dit que pour enregistrer un nouveau livre il faut qu'il y est au moins l'auteur l'éditeur et le titre de renseigner 
  with_options unless: :is_a_known_book? do |unkown_book|
    unkown_book.validates :title, :author, :editor, presence: true
    validate do |book|
      errors.add :base, :invalid, message: "Votre livre n'est pas enregistrer dans la base de donnée, merci de rensegner au moins l'éditeur l'auteur et le titre du livre pour l'intégrer a la base"
    end
  end

  def is_book_available_on_google_book_database?
    GoogleBooks.search("isbn:#{self.isbn}").nil?
  end

  #retourne le livre que l'utilisateur a rentrer
  def is_already_in_our_database
    Book.all.find(isbn: "#{self.isbn}")
  end

  #retourne vraie si il existe dans notre base de donné
  def is_already_in_our_database?
    Book.all.find(isbn: "#{self.isbn}").nil?
  end

  def is_a_known_book?
    return is_already_in_our_database? | is_book_available_on_google_book_database?
  end

  def create_own_book
    OwnBook.create(book: self)
  end
end

#
