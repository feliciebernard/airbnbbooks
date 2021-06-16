class CreatePrivateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :private_adresses do |t|
      t.string :street_name
      t.string :other_information

      t.belongs_to :user, index:true
      t.belongs_to :city, index:true

      t.timestamps
    end
  end
end
