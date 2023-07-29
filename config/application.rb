# frozen_string_literal: true

# application configuration
require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

# Hello rails

module HelloRails
  # class
  class Application < Rails::Application
    config.load_defaults 7.0
  end
end
