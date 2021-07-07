class DropComboFighterTargets < ActiveRecord::Migration[5.2]
  def change
    drop_table :combo_fighter_targets do |t|
      t.timestamps
    end
  end
end
