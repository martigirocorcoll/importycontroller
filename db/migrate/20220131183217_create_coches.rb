class CreateCoches < ActiveRecord::Migration[6.0]
  def change
    create_table :coches do |t|
      t.string :marca
      t.string :modelo
      t.string :kilometraje
      t.string :primeramat
      t.string :chasis

      t.timestamps
    end
  end
end
