class Like < ApplicationRecord
  #いいね機能の実装①
  belongs_to :combo
  belongs_to :user

  #いいね機能の実装②
  #belongs_to :combo
  #belongs_to :user
  #LIKED_COLOR = '#ff3366'
  #.freeze
  #UNLIKED_COLOR = '#A0A0A0'
  #.freeze

end
