class RemoveCategoriesFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :categories
  end
end
