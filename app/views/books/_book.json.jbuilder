json.extract! book, :id, :title, :published_at, :author_id, :created_at, :updated_at, :isbn
json.url book_url(book, format: :json)
