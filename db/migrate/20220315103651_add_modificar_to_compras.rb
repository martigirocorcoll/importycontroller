class AddModificarToCompras < ActiveRecord::Migration[6.0]
  def change
    add_column :compras, :modificar, :boolean
  end
end
