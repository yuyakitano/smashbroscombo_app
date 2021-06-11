class RenameFighterNameColumnToCombos < ActiveRecord::Migration[5.2]
  def change
    rename_column :combos, :fighter_name, :fighter_id
  end
end
