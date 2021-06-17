class Loan < ApplicationRecord
 belongs_to :lender, class_name: "User"
 belongs_to :borrower, class_name: "User"
 belongs_to :own_book

end
