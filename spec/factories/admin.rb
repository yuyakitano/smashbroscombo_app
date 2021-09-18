FactoryBot.define do
  factory :admin do
    name { 'テストアドミン' }
    sequence(:email) { |n| "admintest#{n}@example.com"}
    password { 'adminpassword' }
    password_confirmation { 'adminpassword' }
  end
end