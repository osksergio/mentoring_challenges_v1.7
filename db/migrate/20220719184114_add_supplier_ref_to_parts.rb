class AddSupplierRefToParts < ActiveRecord::Migration[6.1]
  def change
    add_reference :parts, :supplier, null: false, foreign_key: true, index: true
  end
end
