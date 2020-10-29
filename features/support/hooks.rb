require "selenium-webdriver"

Before do
  @methods = Methods.new
  @chatbot = Chatbot.new

  Capybara.current_session.driver.browser.manage.delete_all_cookies
  page.driver.browser.manage.window.maximize
end

After do |scenario|
  Dir.mkdir("data") unless Dir.exist?("data")
  sufix = ("error" if scenario.failed?) || "success"
  name = scenario.name.tr(" ", "_").downcase
  image_name = "data/report/img/#{sufix}-#{name}.png"
  temp_shot = page.save_screenshot(image_name)
  file_shot = File.open(temp_shot, "rb").read
  final_shot = Base64.encode64(file_shot)
  embed(temp_shot, "image/png", "Evidência!")
end

at_exit do
  #time = Time.now.localtime
  run_driver = Capybara.default_driver.to_s.capitalize
  env = EL["Chatbot"]
  date = Time.now.strftime("%A: %d/%^b/%Y")
  time = Time.now.strftime("%HH:%MM")
  ReportBuilder.configure do |config|
    config.json_path = "data/report/report.json"
    config.report_path = "data/report/Cucumber Report Builder"
    config.report_types = [:html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = "Report-Nestle"
    config.include_images = true
    config.compress_images = false
    config.color = "indigo"
    config.additional_info = { "Project:" => "Academia WJ - Trilha 3",
                               "Browser" => run_driver,
                               "URL" => env,
                               "Date" => date,
                               "Time" => time }
  end
  ReportBuilder.build_report
  puts "Report build with success on /data/report/Cucumber Report Builder.html"
end
