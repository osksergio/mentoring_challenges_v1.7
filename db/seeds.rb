# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |i|
  author_description = Faker::Name.name
  author_doc_cpf = Faker::CPF.number
  puts "#{i} - Insert new author: #{author_description}"
  Author.create(description: author_description, cpf: author_doc_cpf)
end

10.times do |i|
  supplier_description = Faker::Company.name
  supplier_doc_cnpj = Faker::CNPJ.number
  puts "#{i} - Insert new supllier: #{supplier_description}"
  Supplier.create(description: supplier_description, cnpj: supplier_doc_cnpj)
end


