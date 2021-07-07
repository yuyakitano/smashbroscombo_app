class DropComboTargetFighters < ActiveRecord::Migration[5.2]
  def change
    drop_table :combo_target_fighters do |t|
      t.references :combo, type: :integer, forein_key: true
      t.references :fighter, type: :integer, foreign_ksy: :true

      t.timestamps
    end
  end
end
