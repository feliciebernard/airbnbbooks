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
    loans.find_by(is_accepted: false)
  end

  def loaned?
    loans.find_by(is_accepted: true, is_past: false).nil? == false
  end
  def borrowed_by
    loans.find_by(is_accepted: true, is_past: false).borrower.name
  end



 # validates :appreciation, format: { with: /[0-5]/ }, in: update


end
