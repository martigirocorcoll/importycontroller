class AddChangeToCompra < ActiveRecord::Migration[6.0]
  def change
    change_column :compras, :car_id, :bigint, null: true

  end
end
