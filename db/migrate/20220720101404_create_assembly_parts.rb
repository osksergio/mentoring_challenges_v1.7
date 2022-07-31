class CreateAssemblyParts < ActiveRecord::Migration[6.1]
  def change
    create_table :assembly_parts, id: false do |t|
      t.references :assembly, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true

      t.timestamps

      t.index [:assembly_id, :part_id], unique: true
    end
  end
end
