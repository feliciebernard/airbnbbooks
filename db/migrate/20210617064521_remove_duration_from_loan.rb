class RemoveDurationFromLoan < ActiveRecord::Migration[5.2]
  def change
    remove_column :loans, :duration, :integer
  end
end
