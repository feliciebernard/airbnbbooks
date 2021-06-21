class AddIsAcceptedToLoan < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :is_accepted, :boolean, default: false
  end
end
