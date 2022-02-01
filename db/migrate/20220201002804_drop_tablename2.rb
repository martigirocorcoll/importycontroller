class DropTablename2 < ActiveRecord::Migration[6.0]
  def change
    drop_table :cobros
  end
end
