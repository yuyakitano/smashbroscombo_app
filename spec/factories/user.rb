FactoryBot.define do
  factory :user do
    username { 'テストユーザー' }
    sequence(:email) { |n| "test#{n}@example.com"}
    password { 'password' }
    password_confirmation { 'password' }
  end
end