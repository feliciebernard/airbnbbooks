class Book < ApplicationRecord
  has_many :own_books
  has_many :users, through: :own_books
  validates :title, presence: true
  validates :authors, presence: true
end

