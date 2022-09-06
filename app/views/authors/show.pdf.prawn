prawn_document do |pdf|
  pdf.text "Author data", :align => :center, :size => 20
  pdf.move_down 20
  pdf.text "Id: #{@author.id}"
  pdf.text "CPF: #{@author.cpf}"
  pdf.text "Name: #{@author.description}"
  pdf.move_down 40
  pdf.text "Books published by the author:"
  pdf.move_down 20
  pdf.table [["ID", "Title", "Published", "ISBN"]] + @books.collect{|b| [b.id, b.title, b.published_at, b.isbn]} do |table_book|
    table_book.header = true
    table_book.columns(1).width = 348
  end
  pdf.move_down 20
  pdf.text "Total number of books published: #{@books.count}"
end