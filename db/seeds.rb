# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# authors
Author.create(description: "Robert Cecil Martin", cpf: "26853563808")
Author.create(description: "Agatha Christie", cpf: "26853563808")

5.times do |i|
  author_description = Faker::Name.name
  author_doc_cpf = Faker::CPF.number
  puts "#{i} - Insert new author: #{author_description}"
  Author.create(description: author_description, cpf: author_doc_cpf)
end

# books
Book.create(title: "Refatoração: Aperfeiçoando o Design de Códigos Existentes", published_at: "2020-04-30T00:00:00Z", author_id: 1, isbn: "8575227246")
Book.create(title: "Código limpo: Habilidades práticas do Agile Software", published_at: "2009-09-08T00:00:00Z", author_id: 1, isbn: "8576082675")
Book.create(title: "O codificador limpo: Um código de conduta para programadores profissionais", published_at: "2012-05-04T00:00:00Z", author_id: 1, isbn: "8576086476")
Book.create(title: "Assassinato no Expresso do Oriente", published_at: "2020-03-09T00:00:00Z", author_id: 2, isbn: "8595086788")
Book.create(title: "Os crimes ABC", published_at: "2020-11-16T00:00:00Z", author_id: 2, isbn: "8595085927")

# suppliers
5.times do |i|
  supplier_description = "#{Faker::Company.name} #{Faker::Company.suffix}"
  supplier_doc_cnpj = Faker::CNPJ.number
  puts "#{i} - Insert new supllier: #{supplier_description}"
  Supplier.create(description: supplier_description, cnpj: supplier_doc_cnpj)
end

# accounts
Account.create(account_number: "261533", supplier_id: 1, digit: "9")
Account.create(account_number: "111111", supplier_id: 2, digit: "6")
#Account.create(account_number: "111112", supplier_id: 3, digit: "8")
#Account.create(account_number: "122223", supplier_id: 4, digit: "3")
#Account.create(account_number: "123223", supplier_id: 5, digit: "8")


