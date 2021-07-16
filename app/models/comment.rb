class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :combo
  has_many :notifications, dependent: :destroy
  

  #バリデーション
  validates :content, presence: true
end
