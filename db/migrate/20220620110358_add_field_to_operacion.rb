class AddFieldToOperacion < ActiveRecord::Migration[6.0]
  def change
    add_column :operacions, :beneficio, :int
  end
end
