class RemoveComboFromComboFighterTargets < ActiveRecord::Migration[5.2]
  def change
    remove_column :combo_fighter_targets, :combo_id, :integer
    remove_column :combo_fighter_targets, :fighter_id, :integer
  end
end
