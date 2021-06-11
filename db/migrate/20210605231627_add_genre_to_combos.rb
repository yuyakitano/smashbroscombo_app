class AddGenreToCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :genre, :integer, null: false
  end
end
