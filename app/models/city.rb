class City < ApplicationRecord
  has_many :private_addresses

 # def self.search(search)  
  # where("lower(cities.name) LIKE :search", search: "%#{search}%").uniq  
  #end
end
