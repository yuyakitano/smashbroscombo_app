FactoryBot.define do
  factory :team do
    user { nil }
    customer_id { "MyString" }
    active_until { "2021-09-17 19:40:22" }
    stripe_subscription_id { "MyString" }
    plan_id { "MyString" }
  end
end
