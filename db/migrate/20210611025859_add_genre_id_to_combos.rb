class AddGenreIdToCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :genre_id, :integer
    add_column :combos, :startposition_id, :integer
  end
end
