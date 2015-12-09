
$test_site = ENV['TEST_SITE'] unless ENV['TEST_SITE'] == nil
#$env = test_site
puts "$test_site value --->#$test_site"




$target_folder = File.expand_path("../lib/resources", "#{File}" )
$: << File.dirname(__FILE__)+'/../../lib'

require 'ole'

World Foundry
World StringFactory
World DateFactory
World Workflows

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 60 # seconds default is 60

browser = nil
headless = nil
$browserPath = ENV['browser_path'] unless ENV['browser_path'].nil?


if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new :destroy_at_exit => false
  headless.start

  #to avoid nil browser error, retry initial browser connect in headless env
  retry_ctr = 0
  while browser.nil? and retry_ctr < 2
    retry_ctr += 1
    puts "debug env.rb - browser init - attempt #{retry_ctr}"
    begin
      browser = Watir::Browser.new :firefox, :http_client => client
      browser.goto("#{$test_site}")
      sleep 2
      # raise "connect failed" unless  browser.text_field(id: "j_username").exists?
      browser.close
      puts "debug env.rb - success: browser connection attempt #{retry_ctr}"
    rescue
      puts "debug env.rb - connect failed"
      browser.close unless browser.nil?
      browser = nil
      sleep 5
    end
  end
  browser = nil
end


#re-use browser for each scenario
Before do
  if browser == nil
    puts "debug  env.rb - creating new browser"
    if $browserPath != nil
      puts 'Trying to open custom browser path'
      Selenium::WebDriver::Firefox.path = $browserPath
    end
    browser = Watir::Browser.new :firefox, :http_client => client
    puts "debug  env.rb - browser.nil? #{browser.nil?}"
  end
  @browser = browser
end

After do | scenario |
  if (scenario.failed?)
    begin
      # Commented out since this code block was creating an exception after upgrading to selenium webdriver to 2.46.2
      #screenshot_img = @browser.driver.save_screenshot("./failure.png")
      #embed(screenshot_img, 'data:image/png')
      # end of comment
      @browser.driver.save_screenshot("./failure.png")
      embed("failure.png", "image/png", "SCREENSHOT")
    rescue Exception => e
      puts "debug env.rb - screenshot failed - #{e.message}"
    end
    @browser.close unless @browser.nil?
    browser = nil
  end

end



at_exit { browser.close unless browser == nil }
