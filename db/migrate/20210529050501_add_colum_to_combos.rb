class AddColumToCombos < ActiveRecord::Migration[5.2]
  def up
    add_column :combos, :startpossibledamage_max, :integer, after: :startpossibledamage_min
    add_column :combos, :youtube_url, :string, after: :level
    add_column :combos, :good_or_bad, :integer
    add_column :combos, :available?, :integer
    add_column :combos, :damage_dealt, :integer
    
  end
  def down
    remove_column :combos, :startpossibledamage_max, :integer, after: :startpossibledamage_min
    remove_column :combos, :youtube_url, :string, after: :level
    remove_column :combos, :good_or_bad, :integer
    remove_column :combos, :available?, :integer
    remove_column :combos, :damage_dealt, :integer
    
  end
end
