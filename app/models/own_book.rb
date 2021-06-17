class OwnBook < ApplicationRecord
  belongs_to :user
  belongs_to :book


  validates :appreciation, format: { with: /[0-5]/ }
  validates :review, lenght: { in: 3..2000 }

end
