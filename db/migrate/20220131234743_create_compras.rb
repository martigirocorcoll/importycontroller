class CreateCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :compras do |t|
      t.integer :precio
      t.decimal :iva
      t.date :fecha
      t.string :tipo
      t.string :categoria
      t.references :persona, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.references :operacion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
