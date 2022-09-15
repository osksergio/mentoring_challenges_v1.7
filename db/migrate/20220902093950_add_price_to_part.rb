class AddPriceToPart < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :price, :decimal
  end
end
