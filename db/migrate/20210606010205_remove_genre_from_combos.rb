class RemoveGenreFromCombos < ActiveRecord::Migration[5.2]
  def change
    remove_column :combos, :genre, :integer
    remove_column :combos, :startposition, :integer
  end
end
