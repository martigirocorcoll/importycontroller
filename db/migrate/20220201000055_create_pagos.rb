class CreatePagos < ActiveRecord::Migration[6.0]
  def change
    create_table :pagos do |t|
      t.decimal :cantidad
      t.date :fecha_teorica
      t.date :fecha_efectiva
      t.references :compra, null: false, foreign_key: true
      t.string :tipo

      t.timestamps
    end
  end
end
