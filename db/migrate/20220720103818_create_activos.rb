class CreateActivos < ActiveRecord::Migration[6.0]
  def change
    create_table :activos do |t|
      t.string :titular
      t.string :tipo
      t.string :descripcion
      t.integer :cantidad

      t.timestamps
    end
  end
end
