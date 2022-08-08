class AddDigitToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :digit, :string
  end
end
