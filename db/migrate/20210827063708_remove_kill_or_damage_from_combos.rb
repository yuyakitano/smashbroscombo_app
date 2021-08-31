class RemoveKillOrDamageFromCombos < ActiveRecord::Migration[5.2]
  def change
    remove_column :combos, :kill_or_damage?, :integer
  end
end
