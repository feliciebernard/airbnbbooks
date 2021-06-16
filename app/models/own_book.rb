class OwnBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :loans
end
