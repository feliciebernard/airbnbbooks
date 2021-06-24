class City < ApplicationRecord
  has_many :private_address
  has_many :searches
end
