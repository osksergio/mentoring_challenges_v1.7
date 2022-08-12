class AddCpfToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :cpf, :string
  end
end
