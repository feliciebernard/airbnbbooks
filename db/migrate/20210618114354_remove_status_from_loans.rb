class RemoveStatusFromLoans < ActiveRecord::Migration[5.2]
  def change
    remove_column :loans, :status, :boolean
  end
end
