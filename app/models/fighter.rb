class Fighter < ApplicationRecord
  has_many :combos
  has_many :combo_fighter_targets, dependent: :destroy
  has_many :combos, through: :combo_fighter_targets, dependent: :destroy
  accepts_nested_attributes_for :combo_fighter_targets
  
end
