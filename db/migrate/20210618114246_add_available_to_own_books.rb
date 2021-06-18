class AddAvailableToOwnBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :own_books, :available, :boolean
  end
end
