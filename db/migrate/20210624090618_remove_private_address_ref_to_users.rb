class RemovePrivateAddressRefToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :users, column: :private_address_id
  end
end
