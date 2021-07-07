class ComboFighterTarget < ApplicationRecord
  belongs_to :combo
  belongs_to :fighter
end
