class AddNotificationToFollows < ActiveRecord::Migration[5.2]
  def change
    add_column :follows, :notification, :boolean, default:false
  end
end
