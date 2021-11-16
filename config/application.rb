require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AuthenticationApp
  class Application < Rails::Application
    config.load_defaults 6.1

    config.action_dispatch.cookies_same_site_protection = :lax

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore,
                          key: '_authentication_app',
                          expire_after: 20.years
    config.middleware.insert_after(
      ActionDispatch::Cookies,
      ActionDispatch::Session::CookieStore,
      key: '_authentication_app',
    )
  end
end
