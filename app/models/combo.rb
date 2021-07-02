class Combo < ApplicationRecord
  belongs_to :user
  has_many :combo_commands, dependent: :destroy
  has_many :commands, through: :combo_commands, dependent: :destroy
  has_many :comments, dependent: :destroy
  #いいね機能の実装①
  has_many :likes, dependent: :destroy
  #いいねソート機能の実装
  #has_many :liked_users, through: :likes, sourse: :user

  #いいね順でソート機能の実装①
  ransacker :likes_count do
    #likesモデルのlikes.combo_idとcombo_idが一致するものをlikes.combo_idが同じものをグループ化して、likes.combo_idの数を数える、
    query = '(SELECT COUNT(likes.combo_id) FROM likes Where likes.combo_id = combos.id GROUP BY likes.combo_id )'    
    Arel.sql(query)
  end




  accepts_nested_attributes_for :combo_commands
  belongs_to :fighter
  
  validates :name, :fighter_id, :level , :user_id, presence: true
  belongs_to :startposition
  belongs_to :genre
  enum level: {easy: 0, normal: 1, difficult: 2}
  

  
  scope :recent, -> { order(created_at: :desc) }
end
