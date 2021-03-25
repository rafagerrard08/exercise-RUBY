require "capybara"
require "capybara/rspec"
require "selenium-webdriver" #importações

RSpec.configure do |config|  
  config.expect_with :rspec do |expectations|   
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|  
    mocks.verify_partial_doubles = true
  end

    config.shared_context_metadata_behavior = :apply_to_host_groups

    config.include Capybara::DSL
    config.before(:example) do
      page.current_window.resize_to(1920, 1080)
    end
  end

  Capybara.register_driver :selenium_firefox do |app|
    Capybara::selenium::Driver.new(app, browser: :firefox, marionette: true)
  end

  Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 5
end
