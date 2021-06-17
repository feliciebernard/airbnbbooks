class RemoveAvailableFromOwnBook < ActiveRecord::Migration[5.2]
  def change
    remove_column :own_books, :available, :boolean
  end
end
