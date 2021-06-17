class OwnBook < ApplicationRecord
  belongs_to :user
  belongs_to :book


 # validates :appreciation, format: { with: /[0-5]/ }, in: update


end
