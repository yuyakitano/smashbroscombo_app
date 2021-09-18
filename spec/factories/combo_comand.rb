FactoryBot.define do
  factory :combo_command do
    association :combo
    association :command
  end
end