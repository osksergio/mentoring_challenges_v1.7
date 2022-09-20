require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MentoringChallengesV17
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: true,
                       helper_specs: true,
                       routing_specs: false,
                       request_specs: false
      g.factory_bot dir: "spec/factories"
    end

    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
