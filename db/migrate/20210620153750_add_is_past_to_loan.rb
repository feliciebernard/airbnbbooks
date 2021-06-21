class AddIsPastToLoan < ActiveRecord::Migration[5.2]
  def change
    add_column :loans, :is_past, :boolean, default: false
  end
end
