class Combo < ApplicationRecord
  belongs_to :user
  has_many :combo_commands, dependent: :destroy
  has_many :commands, through: :combo_commands, dependent: :destroy
  #ターゲットキャラクター
  has_many :combo_fighter_targets, dependent: :destroy
  has_many :fighters, through: :combo_fighter_targets, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  #いいね機能の実装①
  has_many :likes, dependent: :destroy
  #いいねソート機能の実装
  #has_many :liked_users, through: :likes, sourse: :user
  
  #通知機能の実装ーコンボ投稿と通知モデルの紐付け
  has_many :notifications, dependent: :destroy
  
  #いいね順でソート機能の実装①
  ransacker :likes_count do
    #likesモデルのlikes.combo_idとcombo_idが一致するものをlikes.combo_idが同じものをグループ化して、likes.combo_idの数を数える、
    query = '(SELECT COUNT(likes.combo_id) FROM likes Where likes.combo_id = combos.id GROUP BY likes.combo_id )'    
    Arel.sql(query)
  end




  accepts_nested_attributes_for :combo_commands
  accepts_nested_attributes_for :combo_fighter_targets
  belongs_to :fighter
  
  validates :name, :fighter_id, :level , :user_id, presence: true
  belongs_to :startposition
  belongs_to :genre
  enum level: {easy: 0, normal: 1, difficult: 2}
  

  
  scope :recent, -> { order(created_at: :desc) }

  #通知機能「いいね」時
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and combo_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        combo_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end



  #通知機能「コメント」時
  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(combo_id: id).where.not(user_id: current_user.id).distinct
    binding.pry
    temp_ids.each do |temp_id|
      binding.pry
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      combo_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


  #通知機能「フォローユーザーが投稿した」時
  def create_notification_following_post!(current_user)
    #投稿したログインユーザーをフォローしている人のuser_idを取得
    
    follow_ids = Follow.select(:user_id).where('target_user_id = ?', current_user.id)
    binding.pry
    follow_ids.each do |follow_id|
      binding.pry
      save_notification_follow_post!(current_user, follow_id['user_id'])
    end
    # 「フォロー」している人がいる場合通知レコードを作成    
  end
  def save_notification_follow_post!(current_user, visited_id)
    binding.pry
    notification = current_user.active_notifications.new(
      combo_id: id,
      visited_id: visited_id,
      action: 'follow_post'
    )
    notification.save if notification.valid?
    binding.pry
  end




end
