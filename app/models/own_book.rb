class OwnBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :loans

  def mine?
    user == current_user
  end

  def loan_request?
    loans.find_by(is_accepted: false).nil? == false
  end

  def loan_request
    loans.order("created_at DESC").find_by(is_accepted: false)
  end

  def loaned?
    loans.find_by(is_accepted: true, is_past: false).nil? == false
  end

  def loaned
    loans.find_by(is_accepted: true, is_past: false)
  end

  def borrowed_by
    loans.find_by(is_accepted: true, is_past: false).borrower
  end

  def loaned_by
    loans.find_by(is_accepted: true, is_past: false).lender
  end

  def self.search(search)  
   where("lower(books.title) LIKE :search OR 
          lower(books.authors) LIKE :search OR 
          lower(users.name) LIKE :search", search: "%#{search.downcase}%").uniq  
  end

end
