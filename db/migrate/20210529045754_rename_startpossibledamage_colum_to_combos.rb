class RenameStartpossibledamageColumToCombos < ActiveRecord::Migration[5.2]
  def change
    rename_column :combos, :startpossibledamage, :startpossibledamage_min
  end
end
