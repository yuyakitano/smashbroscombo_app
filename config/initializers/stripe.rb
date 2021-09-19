Rails.configuration.stripe = {
  publishable_key: Rails.application.secrets.stripe_publishable_key,
  secret_key: Rails.application.secrets.stripe_secret_key
}

Stripe.api_key = Rails.application.secrets.stripe_secret_key
# Stripe.api_key = Rails.application.credentials.stripe_api_key
# Stripe.api_version = "2021-09-17"

#各々のキーは
#Rails.application.credentials.stripe_publishable_key
#Rails.application.credentials.stripe_api_key
#で取り出せる