class CreateOwnBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :own_books do |t|
      t.text :review
      t.integer :appreciation
      t.boolean :available

      t.belongs_to :book, index:true
      t.belongs_to :user, index:true

      t.timestamps
    end
  end
end
