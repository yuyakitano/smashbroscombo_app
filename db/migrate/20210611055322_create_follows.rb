class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :target_user, null:false, foreign_key: false

      t.timestamps
    end
  end
end
