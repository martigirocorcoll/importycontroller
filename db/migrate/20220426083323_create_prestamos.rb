class CreatePrestamos < ActiveRecord::Migration[6.0]
  def change
    create_table :prestamos do |t|
      t.date :fecha
      t.string :cantidad

      t.timestamps
    end
  end
end
