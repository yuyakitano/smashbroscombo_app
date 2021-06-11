class CreateCombos < ActiveRecord::Migration[5.2]
  def change
    create_table :combos do |t|
      t.string :name
      t.integer :fighterid
      t.integer :startposition
      t.integer :startpossibledamage
      t.integer :level
      t.text :message

      t.timestamps
    end
  end
end
