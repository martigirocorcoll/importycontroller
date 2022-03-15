class AddMatriculanumToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :matriculanum, :string
  end
end
