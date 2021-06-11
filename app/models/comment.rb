class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :combo

  #バリデーション
  validates :content, presence: true
end
