require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CampusLife
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
