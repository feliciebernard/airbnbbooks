class AddTypeToOwnBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :own_books, :genre, :string
  end
end