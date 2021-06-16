class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.boolean :status
      t.integer :duration

      t.belongs_to :own_book, index:true

      t.references :lender, index: true
      t.references :borrower, index: true

      t.timestamps
    end
  end
end
