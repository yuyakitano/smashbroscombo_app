class AddLikesCountToCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :likes_count, :integer
  end
end
