class RemoveComercialToOperacions < ActiveRecord::Migration[6.0]
  def change
    remove_column :operacions, :comercial, :string
  end
end
