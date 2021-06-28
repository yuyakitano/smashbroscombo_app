class Combo < ApplicationRecord
  has_many :combo_commands, dependent: :destroy
  has_many :commands, through: :combo_commands, dependent: :destroy
  has_many :comments, dependent: :destroy
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

  #検索機能の制限
  # def self.ranasackable_attributes(auth_object = nil)
  #   %w[name created_at]
  # end
  # def self.ransackable_associations(auth_object = nil)
  #   []
  # end

  accepts_nested_attributes_for :combo_commands
  belongs_to :fighter
  belongs_to :user
  validates :name, :fighter_id, :level , :user_id, presence: true
  belongs_to :startposition
  belongs_to :genre
  enum level: {easy: 0, normal: 1, difficult: 2}
  

  
  scope :recent, -> { order(created_at: :desc) }
end
