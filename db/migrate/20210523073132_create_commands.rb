class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.integer :commandid
      t.string :name

      t.timestamps
    end
  end
end
