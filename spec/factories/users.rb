FactoryBot.define do
  factory :user do
    username { 'テストユーザー' }
    email { 'test1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end