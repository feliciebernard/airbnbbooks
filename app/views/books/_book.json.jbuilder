json.extract! book, :id, :isbn, :title, :authors, :publisher, :published_date, :language, :categories, :description, :image_link, :created_at, :updated_at
json.url book_url(book, format: :json)
