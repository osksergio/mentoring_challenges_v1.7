class AddCnpjToSuppliers < ActiveRecord::Migration[6.1]
  def change
    add_column :suppliers, :cnpj, :string
  end
end
