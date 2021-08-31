FactoryBot.define do
  factory :combo do
    name { 'テストコンボを書く' }
    fighter
    startpossibledamage_min { 11 }
    level { 'easy' }
    message { nil }
    startpossibledamage_max { 22 }
    youtube_url { nil }
    good_or_bad { nil }
    damage_dealt { 33 }
    genre
    startposition
    user
  end
end