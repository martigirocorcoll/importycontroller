class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.integer :precio
      t.decimal :iva
      t.date :fecha
      t.references :persona, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.references :operacion, null: false, foreign_key: true
      t.string :numero
      t.boolean :coche_cambio
      t.integer :coche_cambio_precio
      t.decimal :coche_cambio_iva

      t.timestamps
    end
  end
end
