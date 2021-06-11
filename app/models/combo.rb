class Combo < ApplicationRecord
  has_many :combo_commands, dependent: :destroy
  has_many :commands, through: :combo_commands, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  accepts_nested_attributes_for :combo_commands
  belongs_to :fighter
  belongs_to :user
  validates :user_id, presence: true
  belongs_to :startposition
  belongs_to :genre
  enum level: {easy: 0, normal: 1, difficult: 2}
end
