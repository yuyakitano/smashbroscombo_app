class ChangeDataTypeFighterIdOfCombos < ActiveRecord::Migration[5.2]
  def change
    change_column :combos, :fighter_id, 'integer USING CAST(fighter_id AS integer)'
  end
end
