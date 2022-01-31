class CreateOperacions < ActiveRecord::Migration[6.0]
  def change
    create_table :operacions do |t|
      t.string :estado
      t.string :comercial

      t.timestamps
    end
  end
end
