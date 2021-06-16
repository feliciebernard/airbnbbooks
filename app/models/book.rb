class Book < ApplicationRecord
  has_many :own_books
  has_many :users, through: :own_books
end
