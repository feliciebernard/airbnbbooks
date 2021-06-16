class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :authors
      t.string :publisher
      t.integer :published_date
      t.string :language
      t.string :categories
      t.text :description
      t.string :image_link

      t.timestamps
    end
  end
end
