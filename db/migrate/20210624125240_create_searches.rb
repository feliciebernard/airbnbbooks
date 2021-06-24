class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.belongs_to :book, index:true
      t.belongs_to :user, index:true
      t.belongs_to :city, index:true
      t.timestamps
    end
  end
end
