prawn_document do |pdf|
  pdf.text "Author data:"
  pdf.move_down 20
  pdf.text "Id: #{@author.id}"
  pdf.text "Name: #{@author.description}"
end