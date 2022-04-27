class AddPersonatoPrestamo < ActiveRecord::Migration[6.0]
  def change
    change_table(:prestamos) do |t|
      t.references :prestamista, foreign_key: { to_table: 'personas' }
      t.references :prestatario, foreign_key: { to_table: 'personas' }
    end
  end
end
