require "rspec"
require "yaml"
require "report_builder"
require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "faker"
require 'cpf_faker'

@browser = ENV["BROWSER"]

Capybara.configure do |config|
  case @browser
  when "chrome"
    @driver = :selenium_chrome
  when "firefox"
    @driver = :selenium
  when "chrome_headless"
    @driver = :selenium_chrome_headless
  when "firefox_headless"
    @driver = :selenium_headless
  end

  config.default_driver = @driver
  config.default_max_wait_time = 30
  config.default_selector = :css
end

EL = YAML.load_file("./data/elm.yml")