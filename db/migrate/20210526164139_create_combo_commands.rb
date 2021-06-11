class CreateComboCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :combo_commands do |t|
      t.references :combo, type: :integer, foreign_key: true
      t.references :command, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end
