class Combo < ApplicationRecord
  has_many :combo_commands, dependent: :destroy
  has_many :commands, through: :combo_commands, dependent: :destroy
  has_many :comments, dependent: :destroy
  

  accepts_nested_attributes_for :combo_commands
  belongs_to :fighter
  belongs_to :user
  validates :user_id, presence: true
  belongs_to :startposition
  belongs_to :genre
  enum level: {easy: 0, normal: 1, difficult: 2}
  
  #いいね機能の実装①
  has_many :likes, dependent: :destroy
  
  #いいね機能の実装②
  # has_many :likes, dependent: :destroy
  # def like_by(user)
  #   likes.where(likes: { user_id: user }).last
  # end
  # def liked_by?(user)
  #   like_by(user).present?
  # end
  
end
