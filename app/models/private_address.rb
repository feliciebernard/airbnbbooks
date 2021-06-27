class PrivateAddress < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :city

  def to_s
    if (city.nil?)
      return "pas d'addresse renseigné..."
    else
      return "#{street_name}, #{city.zip_code}, #{city.name}"
    end
  end

end
