require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
# Rails.application.config.assets.paths << Rails.root.join("vendor", "original_assets", "images")
# Rails.application.config.assets.paths << Rails.root.join("vendor", "original_assets", "stylesheets")
# Rails.application.config.assets.paths << Rails.root.join("vendor", "original_assets", "javascripts")
module SmashbroscomboApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    #⬇︎enum導入時、name等でのエラー対応
    config.paths.add 'lib', eager_load: true
    #時間設定
    config.time_zone = 'Asia/Tokyo'
    config.i18n.default_locale = :ja

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    
    
  end
end
