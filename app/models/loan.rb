class Loan < ApplicationRecord

  after_create :send_request_to_loan_book
  after_update :send_accepted_request, unless: :is_past?
  after_update :send_book_returned_email, if: :is_past?
  after_destroy :send_declined_request

  belongs_to :lender, class_name: "User"
  belongs_to :borrower, class_name: "User"
  belongs_to :own_book
  
  def is_past?
    is_past
  end

  def send_request_to_loan_book
   UserMailer.ask_owner_to_borrow_his_book(self).deliver_now
   UserMailer.copy_ask_owner_to_borrow_his_book(self).deliver_now
  end

  def send_declined_request
    UserMailer.request_declined(self).deliver_now
  end
  def send_accepted_request
    UserMailer.request_accepted(self).deliver_now
  end
  def send_book_returned_email
    UserMailer.book_returned_email_to_borrower(self).deliver_now
    UserMailer.book_returned_email_to_owner(self).deliver_now
  end
end
