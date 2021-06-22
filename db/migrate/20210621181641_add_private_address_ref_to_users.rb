class AddPrivateAddressRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :private_address, foreign_key: true
  end
end
