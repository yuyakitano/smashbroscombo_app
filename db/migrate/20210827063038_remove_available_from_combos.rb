class RemoveAvailableFromCombos < ActiveRecord::Migration[5.2]
  def change
    remove_column :combos, :available?, :integer
  end
end
