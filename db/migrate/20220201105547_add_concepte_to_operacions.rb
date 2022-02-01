class AddConcepteToOperacions < ActiveRecord::Migration[6.0]
  def change
    add_column :operacions, :titol, :string
    add_column :operacions, :venedor, :string
  end
end
