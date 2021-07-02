class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :combos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  #いいねソート機能の実装
  #has_many :liked_combos, through: :likes, source: :combo
  

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
end
