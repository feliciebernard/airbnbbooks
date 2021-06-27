class OwnBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :loans


  def loan_request?
    loans.any? == true ? loans.last.is_accepted == false : false
  end

  def current_loan
    loans.last
  end

  def is_loan_past?
    loans.any? == true ? loans.last.is_past : false
  end

  def loaned?
    if loans.any?
      last_loan = loans.last
      last_loan.is_accepted == true && last_loan.is_past == false
    else
      false
    end
  end


  def borrowed_by
    loans.last.borrower
  end

  def self.search(search)  
   where("lower(books.title) LIKE :search OR 
          lower(books.authors) LIKE :search OR 
          lower(users.name) LIKE :search", search: "%#{search.downcase}%").uniq  
  end

end
