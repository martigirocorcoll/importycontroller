class CreateFlujos < ActiveRecord::Migration[6.0]
  def change
    create_table :flujos do |t|
      t.decimal :cantidad
      t.date :fecha_teorica
      t.date :fecha_efectiva
      t.references :prestamo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
