class AddComptabilitzatToOperacions < ActiveRecord::Migration[6.0]
  def change
    add_column :operacions, :comptabilitzat, :boolean
  end
end
