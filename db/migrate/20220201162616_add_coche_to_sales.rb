class AddCocheToSales < ActiveRecord::Migration[6.0]
  def change
    remove_column :sales, :coche_cambio_iva, :decimal
    add_column :sales, :coche_cambio_modelo, :string
    add_column :sales, :coche_cambio_km, :string
    add_column :sales, :coche_cambio_matricula, :string
    add_column :sales, :coche_cambio_ano, :string
  end
end
