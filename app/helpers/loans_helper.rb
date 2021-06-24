module LoansHelper

  def user_loan?(user)
    Loan.where(borrower: user).nil?
  end

  def user_borrow?(user)
    Loan.where(lender: user).nil?
  end
end
