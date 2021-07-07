class CreateTableComboFighterTarget < ActiveRecord::Migration[5.2]
  def change
    create_table :combo_fighter_targets do |t|
      t.references :combo, type: :integer, foreign_key: true
      t.references :fighter, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end
