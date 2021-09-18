class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :combos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  #通知機能
  
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  #いいねソート機能の実装
  #has_many :liked_combos, through: :likes, source: :combo
  
  #フォロー機能
  has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_user_id'
  has_many :followings, through: :active_relationships, source: :target_user
  has_many :followers, through: :passive_relationships, source: :user

  #refile導入（ユーザー画像投稿実装）
  #Refileがprofile_imageカラムにアクセスするためにattachmentメソッドをuserモデルに登録することが必要
  attachment :profile_image
  
  def liked_by?(combo_id)
    likes.where(combo_id: combo_id).exists?
  end
  #通知機能「フォロー」時
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
  
  has_one :team

  def unsubscribe
    team = Team.find_by(user_id: self.id)
    team.destroy
  end

end
