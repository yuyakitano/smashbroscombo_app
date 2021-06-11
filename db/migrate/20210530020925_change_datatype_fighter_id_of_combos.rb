class ChangeDatatypeFighterIdOfCombos < ActiveRecord::Migration[5.2]
  def change
    change_column :combos, :fighter_id, :string
    rename_column :combos, :fighter_id, :fighter_name
  end
end
