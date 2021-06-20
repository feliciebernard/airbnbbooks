class OwnBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :loans

  def is_mine?
    return self.user == current_user
  end
 # validates :appreciation, format: { with: /[0-5]/ }, in: update


end
