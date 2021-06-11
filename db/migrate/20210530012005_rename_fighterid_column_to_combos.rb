class RenameFighteridColumnToCombos < ActiveRecord::Migration[5.2]
  def change
    rename_column :combos, :fighterid, :fighter_id
  end
end
