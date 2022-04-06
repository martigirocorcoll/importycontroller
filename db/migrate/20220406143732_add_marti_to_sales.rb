class AddMartiToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :marti, :boolean
  end
end
