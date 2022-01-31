class CreatePersonas < ActiveRecord::Migration[6.0]
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido
      t.string :mail
      t.string :telefono
      t.string :direccion
      t.string :ciudad
      t.string :cp
      t.string :pais
      t.string :cif

      t.timestamps
    end
  end
end
