class Loan < ApplicationRecord
 belongs_to :lender, class_name: "User"
 belongs_to :borrower, class_name: "User"
 belongs_to :own_book

 def duration
  days_number = (self.start_date.to_date - Date.today).to_i
  is_past = self.is_returned ? "a durée " : "dure depuis "
  is_past + "#{days_number / 30} mois et #{days_number % 30} jours" 
 end
end
