class CreateGastomensuals < ActiveRecord::Migration[6.0]
  def change
    create_table :gastomensuals do |t|
      t.string :titol
      t.integer :cantidad
      t.integer :iva

      t.timestamps
    end
  end
end
