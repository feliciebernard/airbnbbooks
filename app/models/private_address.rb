class PrivateAddress < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :user, presence: true

end
