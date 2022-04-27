class AddInteresToPrestamos < ActiveRecord::Migration[6.0]
  def change
    add_column :prestamos, :interes, :int
  end
end
