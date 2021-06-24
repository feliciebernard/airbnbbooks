class Search < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :city

  def self.search(search)  
   where("lower(books.authors) LIKE :search", search: "%#{search.downcase}%").uniq  
  end
end
