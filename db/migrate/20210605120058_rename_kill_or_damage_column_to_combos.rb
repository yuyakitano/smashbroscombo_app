class RenameKillOrDamageColumnToCombos < ActiveRecord::Migration[5.2]
  def change
    rename_column :combos, :kill_or_damage, :genre
  end
end
