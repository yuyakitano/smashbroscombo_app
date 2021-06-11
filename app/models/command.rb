class Command < ApplicationRecord
  has_many :combo_commands, dependent: :destroy
  has_many :combos, through: :combo_commands, dependent: :destroy
  accepts_nested_attributes_for :combo_commands
end
